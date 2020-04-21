extends Area2D

signal invincibility_started
signal invincibility_ended

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	effect.global_position = global_position
	var main = get_tree().current_scene
	main.add_child(effect)

func _on_Timer_timeout():
	self.invincible = false #we don't call the setter as we put "self" in front

func _on_HurtBox_invincibility_started():
	set_deferred("monitorable", false)

func _on_HurtBox_invincibility_ended():
	monitorable = true
