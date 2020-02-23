extends Area2D

#This defines a custom signal called “hit” that we will have our player emit (send out) 
#when it collides with an enemy.
signal hit

###############################################################################
#							Member Variables:							  	  #
###############################################################################

# Export means that this variable will be visible on the inspector
export var speed = 400 # How fast the player will move
var screen_size        # Size of the game widnow


###############################################################################
#							Callback Functions:								  #
###############################################################################

# Called when the node enters the scene tree for the first time
func _ready():
	#Set the screen size when the node is ready for first time
	screen_size = get_viewport_rect().size
	hide()

func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit
	#Each time an enemy hits the player, the signal is going to be emitted. 
	emit_signal("hit")
	#We need to disable the player’s collision so that we don’t trigger the hit signal more than once.
	$CollisionShape2D.set_deferred("disabled", true)

func _on_Player_hit():
	game_over()

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	var velocity = get_input_velocity() # The player's movement vector
	if velocity.length() > 0: velocity = velocity.normalized() * speed
	
	animate(velocity)
	position = update_position(position, velocity, delta)

###############################################################################
#							Helper Functions:								  #
###############################################################################

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

#Reads the input and returns the velocity vector
func get_input_velocity():
	var velocity = Vector2()  
	if Input.is_action_pressed("ui_right"): velocity.x += 1
	if Input.is_action_pressed("ui_left"):  velocity.x -= 1
	if Input.is_action_pressed("ui_down"):  velocity.y += 1
	if Input.is_action_pressed("ui_up"):    velocity.y -= 1
	return velocity

#updates the given position with the velocity and returns the new value
func update_position(position, velocity, delta):
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	return position

#We can use animated sprite because it'sa child of the current node
func animate(velocity):
	if velocity.length() > 0: $AnimatedSprite.play()
	else:                     $AnimatedSprite.stop()

	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
