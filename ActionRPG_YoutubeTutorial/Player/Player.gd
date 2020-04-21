extends KinematicBody2D

export var ACCELERATION = 500
export var FRICTION = 500
export var MAX_SPEED = 100
export var ROLL_SPEED = 125

enum {MOVE, ROLL, ATTACK}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN #same as default looking position (blend space 0,1)
var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox
onready var hurtBox = $HurtBox


func _ready():
	stats.connect("no_health", self, "queue_free")
	animationTree.active = true
	swordHitbox.knockback_vector = roll_vector

func _on_HurtBox_area_entered(area):
	stats.health -= 1
	hurtBox.start_invincibility(0.5)
	hurtBox.create_hit_effect()

func _physics_process(delta):
	match state:
		MOVE: 
			move_state(delta)
		ROLL: 
			roll_state(delta)
		ATTACK: 
			attack_state(delta)


#MOVE STATE
func move_state(delta):
	#Apply movement and update animation information
	var input_vector = get_input_vector()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move()

	#Switch to other states
	if Input.is_action_just_pressed("roll"): state = ROLL
	if Input.is_action_just_pressed("attack"): state = ATTACK

func get_input_vector() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

func move(): velocity = move_and_slide(velocity)


#ROLL STATE
func roll_state(delta):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func roll_animation_finished():
	velocity *= 0.8
	state = MOVE


#ATTACK STATE
func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE
