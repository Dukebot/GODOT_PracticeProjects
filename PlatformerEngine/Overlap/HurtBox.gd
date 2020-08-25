extends Area2D

signal hit

func hit(damage): emit_signal("hit", damage)
