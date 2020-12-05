extends Actor

var player = null

onready var sprite = $Sprite
onready var animated_sprite = $AnimatedSprite

func _process(delta):
	if player:
		if player.position.x >= position.x:
			sprite.flip_h = false
			animated_sprite.flip_h = false
		else:
			sprite.flip_h = true 
			animated_sprite.flip_h = true


func _on_PlayerDetector_body_entered(body):
	player = body

func _on_PlayerDetector_body_exited(body):
	player = null
