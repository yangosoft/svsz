extends Node

export(PackedScene) var mob_scene
export(PackedScene) var zombie_scene
export(PackedScene) var something_0

export(PackedScene) var zombie_sprite



var score
var is_dragging = false
var somethingType = "res://Something.gd"


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
	# $Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	#$Music.play()
	
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
	# var zombie = zombie_scene.instance()
	var direction = PI
	# Choose a random location on Path2D.
	# var mob_spawn_location = get_node("ZombiePath_0/PathFollow2D")
	# var velocity = Vector2(130, 0.0)
	# zombie.rotation = 0
	# zombie.position = Vector2(1000 , 250)
	# zombie.linear_velocity = velocity.rotated(direction)
	
	# Set the mob's direction perpendicular to the path direction.
	
	# Spawn the smob by adding it to the Main scene.
	# add_child(zombie)
	for i in range(1,7):
		break
		var zombie = zombie_scene.instance()
		var mob_spawn_location = get_node("ZombiePath_0/PathFollow2D")
		var velocity = Vector2(30, 0.0)
		zombie.rotation = 0
		zombie.position = Vector2(1000 , (i*100)+50)
		zombie.linear_velocity = velocity.rotated(direction)
		
		
		zombie.set_line_number(i)
		
		add_child(zombie)
		
	var z1 = zombie_sprite.instance()
	
	
	z1.rotation = 0
	z1.position = Vector2(1000 , (3*100)+50)
	# z1.linear_velocity = velocity.rotated(direction)
	z1.set_line_number(3)
	add_child(z1)
	
	
	var z2 = zombie_sprite.instance()
	
	
	z2.rotation = 0
	z2.position = Vector2(600 , (3*100)+50)
	# z1.linear_velocity = velocity.rotated(direction)
	z2.set_line_number(3)
	add_child(z2)
	z2.is_moving = false
	

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_AnimatedSprite_something_hit():
	$MobTimer.stop()
	pass # Replace with function body.


func _on_Something0_gui_input2(event):
	print(str(event))
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		var s = something_0.instance()
		
		s.set_script(load("res://SomethingShooter.gd"))
		s.position = Vector2(252,352)
		add_child(s)
	


func _on_Something0_mouse_entered():
	print("Mouse event")


func _onSomethingClick(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		print("ok")
		is_dragging = true


func _onMouseMove(event):
	var pos = get_viewport().get_mouse_position()
	
	if is_dragging and event is InputEventMouseMotion:
		$SomethingMouseFollower.show()
		pos[0] = pos[0] - int(int(pos[0]) % 100) + 0
		pos[1] = pos[1] - int(int(pos[1]) % 100) + 0
		#print("Mouse moving " + str(pos))
		
		if ( pos[0] < 200 ) or (pos[1] < 100) or (pos[0] > 1100) or (pos[1] > 600):
			$SomethingMouseFollower.hide()
			return
		else:
			$SomethingMouseFollower.show()
			
		$SomethingMouseFollower.set_position( pos )
		
	if is_dragging and event is InputEventMouseButton  and event.button_index == BUTTON_LEFT  and event.pressed:
		is_dragging = false
		$SomethingMouseFollower.hide()
		pos[0] = pos[0] - int(int(pos[0]) % 100) + 50
		pos[1] = pos[1] - int(int(pos[1]) % 100) + 50
		var s = something_0.instance()
		
		s.set_script(load(somethingType))
		s.position = pos
		s.line_position = int(pos[1]/100.0) 
		add_child(s)

func _on_Something0_gui_input(event):
	somethingType = "res://Something.gd"
	_onSomethingClick(event)

func _on_Something1_gui_input(event):
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)

func _on_Something2_gui_input(event):
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)

func _on_Something3_gui_input(event):
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)

func _on_Something4_gui_input(event):
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)

func _on_Something5_gui_input(event):
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)
	pass # Replace with function body.
