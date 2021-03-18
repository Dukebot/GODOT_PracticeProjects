class_name HealthComponent
extends Node

signal damaged
signal healed
signal no_health

const DEBUG := true

export var max_health := 100.0

var invincible := false

onready var health := max_health


func damage(amount: float) -> bool:
	var damaged := false
	
	if not invincible:
		damaged = true
		emit_signal("damaged")
		health -= amount
		if health <= 0:
			emit_signal("no_health")
		if DEBUG: print("I've been damaged... current health is " + str(health))
	
	return damaged


func heal(amount: float) -> bool:
	var healed := false
	
	if health < max_health:
		healed = true
		emit_signal("healed")
		health += amount
		if health > max_health:
			health = max_health
		if DEBUG: print("I've been healed... current health is " + str(health))
	
	return healed
