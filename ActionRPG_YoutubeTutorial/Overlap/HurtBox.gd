extends Area2D

export (bool) var show_hit = true

const HitEffect = preload("res://Effects/HitEffect.tscn")

func _on_HurtBox_area_entered(area):
	if not show_hit: return
	
	var effect = HitEffect.instance()
	effect.global_position = global_position
	
	var main = get_tree().current_scene
	main.add_child(effect)
