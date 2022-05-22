extends Node

export(PackedScene) var mob_scene
export(PackedScene) var zombie_scene
var score

func _ready():
	randomize()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()


func new_game():
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	# $Music.play()
	
func _nothing():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _on_MobTimer_timeout():
	var zombie = zombie_scene.instance()
	var direction = PI
	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("ZombiePath_0/PathFollow2D")
	var velocity = Vector2(130, 0.0)
	zombie.rotation = 0
	zombie.position = Vector2(1000 , 250)
	zombie.linear_velocity = velocity.rotated(direction)
	
	# Set the mob's direction perpendicular to the path direction.
	
	# Spawn the mob by adding it to the Main scene.
	add_child(zombie)

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_AnimatedSprite_something_hit():
	$MobTimer.stop()
	pass # Replace with function body.
