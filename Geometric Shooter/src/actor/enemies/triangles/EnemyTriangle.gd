extends Enemy

func _ready():
	#movement_component.set_random_direction()
	var player = get_tree().current_scene.get_player()
	movement_component.set_direction((player.position - position).normalized())
	rotation = movement_component.get_direction().angle()

func init(initial_position, target_position):
	position = initial_position
	movement_component.set_direction( (target_position - initial_position).normalized() )

func _physics_process(delta):
	rotation = movement_component.get_direction().angle()
	movement_component.move(delta)

func _on_LifeTimer_timeout():
	destroy()
