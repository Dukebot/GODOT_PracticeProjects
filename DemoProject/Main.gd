extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

#Called when HUD emits the signal to start the game
func new_game():
	score = 0
	$HUD.update_score(score)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready")
	$Music.play()

#Called when player emits hit signal
func game_over():
	$DeathSound.play()
	$Music.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

#The start timer runs the other timers
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

#Called every time we have to spawn a mob
func _on_MobTimer_timeout():
	
	# choose a random location on the Path2D
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	
	# add some randomness to the direction
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(
		Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction)
	)

#Called every time we have to add score
func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
