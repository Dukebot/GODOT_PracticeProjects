extends Node2D

var Item

func respawn(item_text, _position, delay):
	print("respawn")
	Item = load(item_text)
	position = _position
	$Timer.start(delay)

func _on_Timer_timeout():
	print("respawn timeout")
	var item = Item.instance()
	get_parent().add_child(item)
	item.position = position
	queue_free()
