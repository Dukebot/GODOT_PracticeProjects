extends Node
class_name Weapon

export var fire_range := 100.0
export var fire_rate := 0.5
export var clip_size := 5
export var reload_rate := 1.0

onready var ammo_label = $"/root/World/UI/Label"
onready var raycast = $"../Head/Camera/RayCast"

var current_ammo := clip_size
var can_fire := true
var reloading := false

func _ready():
	raycast.cast_to = Vector3(0, 0, -fire_range)


func _process(delta):
	ammo_label.set_text("%d / %d" % [current_ammo, clip_size])
	
	if Input.is_action_just_pressed("primary_fire") and can_fire:
		if current_ammo > 0 and not reloading:
			fire()
		elif not reloading:
			reload()
	
	if Input.is_action_just_pressed("reload") and not reloading:
		reload()


func fire():
	print("fired weapon")
	can_fire = false
	current_ammo -= 1
	check_collision()
	yield(get_tree().create_timer(fire_rate, false), "timeout")
	can_fire = true

func reload():
	print("reloading")
	reloading = true
	yield(get_tree().create_timer(reload_rate, false), "timeout")
	reloading = false
	current_ammo = clip_size

func check_collision():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enemies"):
			collider.queue_free()
			print("Killed " + collider.name)
