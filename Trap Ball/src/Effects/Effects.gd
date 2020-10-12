extends Node2D

export var Particle = preload("res://src/Effects/Particle.tscn")
export var HitEffect = preload("res://src/Effects/HitEffect.tscn")
export var RespawnEffect = preload("res://src/Effects/SpawnEffect.tscn")


func create_particles(_position, num_particles):
	add_effect_scenes(Particle, _position, num_particles)

func create_hit_effect(_position):
	add_effect_scene(HitEffect, _position)

func create_respawn_effect(_position):
	add_effect_scene(RespawnEffect, _position)



func add_effect_scene(EffectScene, _position):
	var effect = EffectScene.instance()
	effect.position = _position
	add_child(effect)

func add_effect_scenes(EffectScene, _position, num_scenes):
	for _i in range(num_scenes):
		add_effect_scene(EffectScene, _position)


