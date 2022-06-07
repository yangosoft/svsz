extends Node

export(PackedScene) var mob_scene
export(PackedScene) var zombie_scene
export(PackedScene) var golem_scene
export(PackedScene) var ghost_scene
export(PackedScene) var gloop_scene
export(PackedScene) var something_0
export(PackedScene) var something_1
export(PackedScene) var something_2
export(PackedScene) var something_3
export(PackedScene) var something_4
export(PackedScene) var something_5



export(PackedScene) var zombie_sprite

export(PackedScene) var win_scene


var defense_map = []




var score
var is_dragging = false
var somethingType = "res://Something.gd"
var stars = 15

var win_score = 100
signal gen_star
signal defense_die

var NUMBER_MAXIMUM_ENEMIES = 14
var NUMBER_MAXIMUM_GOLEM = 2
var difficulty = 0


func _ready():
	
	randomize()
	for i in range(60):
		defense_map.append(false)


func _process(delta):
	if int($DefenseGroup/Something0/Label.text) > stars:
		$DefenseGroup/Something0.modulate.a = 0.3
	else:
		$DefenseGroup/Something0.modulate.a = 1
		
	if int($DefenseGroup/Something1/Label.text) > stars:
		$DefenseGroup/Something1.modulate.a = 0.3
	else:
		$DefenseGroup/Something1.modulate.a = 1
		
	if int($DefenseGroup/Something2/Label.text) > stars:
		$DefenseGroup/Something2.modulate.a = 0.3
	else:
		$DefenseGroup/Something2.modulate.a = 1
		
	if int($DefenseGroup/Something3/Label.text) > stars:
		$DefenseGroup/Something3.modulate.a = 0.3
	else:
		$DefenseGroup/Something3.modulate.a = 1
		
	if int($DefenseGroup/Something4/Label.text) > stars:
		$DefenseGroup/Something4.modulate.a = 0.3
	else:
		$DefenseGroup/Something4.modulate.a = 1
		
	if int($DefenseGroup/Something5/Label.text) > stars:
		$DefenseGroup/Something5.modulate.a = 0.3
	else:
		$DefenseGroup/Something5.modulate.a = 1
		
	if int($DefenseGroup/Something6/Label.text) > stars:
		$DefenseGroup/Something6.modulate.a = 0.3
	else:
		$DefenseGroup/Something6.modulate.a = 1
	
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
func win_game():
	get_tree().call_group("enemy", "queue_free")
	get_tree().call_group("defender", "queue_free")
	get_tree().call_group("bullet", "queue_free")
	$WinScene.show()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_win()
	$Music.stop()

func new_game(difficulty):
	if(difficulty > 0):
		$MobTimer.wait_time = 10 - (difficulty*2)
	win_score = 100 * (difficulty+1)
	$WinScene.hide()
	print(str(difficulty))
	self.difficulty = difficulty
	# new game
	get_tree().call_group("enemy", "queue_free")
	get_tree().call_group("defender", "queue_free")
	get_tree().call_group("bullet", "queue_free")
	score = 0
	stars = 15
	# $Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD/lblStars.text = str(stars)
	$HUD.show_message("Get Ready")
	#$Music.play()
	for i in range(60):
		defense_map[i]=false
	
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
	
	for i in range(1,7):
		break
		var zombie = golem_scene.instance()
		var mob_spawn_location = get_node("ZombiePath_0/PathFollow2D")
		var velocity = Vector2(30, 0.0)
		zombie.rotation = 0
		zombie.position = Vector2(1200 , (i*100)+50)
		zombie.linear_velocity = velocity.rotated(direction)
		
		
		zombie.set_line_number(i)
		
		add_child(zombie)
		
	for i in range(1,7):
		if get_tree().get_nodes_in_group("enemy").size() > NUMBER_MAXIMUM_ENEMIES + (self.difficulty * 10):
			continue
		var r = rand_range(0,1)
		var base_prob = 0.6
		base_prob = base_prob - (self.difficulty / 10)
		if ( r < base_prob ):
			continue
		var z1 = zombie_sprite.instance()
		if ( r  > base_prob + 0.15):
			r = rand_range(0,1)
			if (r < 0.5):
				z1 = ghost_scene.instance()
			else:
				z1 = gloop_scene.instance()
				
		z1.movement_ms = z1.movement_ms - (difficulty*7)
		
		if (r > 0.9 - (self.difficulty / 1000 )) and  get_tree().get_nodes_in_group("golem").size() < (NUMBER_MAXIMUM_GOLEM + self.difficulty*2):
			z1 = golem_scene.instance()
			z1.movement_ms = z1.movement_ms - (difficulty*15)
		z1.rotation = 0
		z1.position = Vector2(1200 , (i*100)+50)
		# z1.linear_velocity = velocity.rotated(direction)
		z1.set_line_number(i)
		add_child(z1)
	
	
	
	

func _on_ScoreTimer_timeout():
	if (score >= win_score):
		win_game()
		return
	score += 1
	$HUD.update_score(score)
	var s = Vector2( (score * 703) / win_score , 32 )
	$HUD/ColorRect.set_size( s )
	
	


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
		$AudioSomething.play()
		is_dragging = true


func _onMouseMove(event):
	var pos = get_viewport().get_mouse_position()
	var map_index = 0
	pos[0] = pos[0] - int(int(pos[0]) % 100) + 0
	pos[1] = pos[1] - int(int(pos[1]) % 100) + 0
	map_index = int(pos[1] / 100) * 10 + int(int(pos[0]) / 100) - 12
	pos = get_viewport().get_mouse_position()
	
	if is_dragging and event is InputEventMouseMotion:
		$SomethingMouseFollower.show()
		pos[0] = pos[0] - int(int(pos[0]) % 100) + 0
		pos[1] = pos[1] - int(int(pos[1]) % 100) + 0
		map_index = int(pos[1] / 100) * 10 + int(int(pos[0]) / 100) - 12
		print("map_index " + str(map_index))
		
		
		if (pos[0] < 200) or (pos[1] < 100) or (pos[0] > 1100) or (pos[1] > 600):
			$SomethingMouseFollower.hide()
			return
		else:
			$SomethingMouseFollower.show()
			
		$SomethingMouseFollower.set_position(pos)
		
	if map_index < 60 and map_index >= 0:
		if is_dragging and event is InputEventMouseButton  and event.button_index == BUTTON_LEFT  and event.pressed and defense_map[map_index] == false:
			is_dragging = false
			
			$SomethingMouseFollower.hide()
			pos[0] = pos[0] - int(int(pos[0]) % 100) + 50
			pos[1] = pos[1] - int(int(pos[1]) % 100) + 50
			
			var s = something_0.instance()
			if somethingType == "res://SomethingBarrier.gd":
				s = something_1.instance()
			elif somethingType == "res://SomethingGenerator.gd":
				s = something_2.instance()
			elif somethingType == "res://SomethingTNT.gd":
				s = something_3.instance()
			elif somethingType == "res://SomethingCatapult.gd":
				print("will be a catapult!")
				s = something_4.instance()
			elif somethingType == "res://SomethingElectric.gd":
				s = something_5.instance()
			
			s.set_script(load(somethingType))
			
			if (s.star_cost > stars):
				return
			
			
			s.position = pos
			s.line_position = int(pos[1]/100.0) 
			defense_map[map_index] = true
			s.index_in_map = map_index
			print("COST " + str(s.star_cost))
			stars -= s.star_cost
			$HUD/lblStars.text = str(stars)
			add_child(s)

func _on_Something0_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something0.texture
	somethingType = "res://SomethingCatapult.gd"
	_onSomethingClick(event)

func _on_Something1_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something1.texture
	somethingType = "res://SomethingTNT.gd"
	_onSomethingClick(event)

func _on_Something2_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something2.texture
	somethingType = "res://SomethingGenerator.gd"
	_onSomethingClick(event)

func _on_Something3_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something3.texture
	somethingType = "res://SomethingElectric.gd"
	_onSomethingClick(event)

func _on_Something4_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something4.texture
	somethingType = "res://SomethingShooterBig.gd"
	_onSomethingClick(event)

func _on_Something5_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something5.texture
	somethingType = "res://SomethingBarrier.gd"
	_onSomethingClick(event)
	pass # Replace with function body.
	
func _on_Something6_gui_input(event):
	$SomethingMouseFollower.texture = $DefenseGroup/Something6.texture
	somethingType = "res://SomethingShooter.gd"
	_onSomethingClick(event)
	pass # Replace with function body.


func _on_EndGameArea_area_entered(area):
	if area.is_in_group("enemy"):
		game_over()


func _on_Main_gen_star():
	print("NEW STAR")
	stars += 10
	$HUD/lblStars.text = str(stars)


func _on_Main_defense_die(index_in_map):
	print("Defense die " + str(index_in_map))
	defense_map[index_in_map] = false
	pass # Replace with function body.


func _on_BtnRestart_pressed():
	game_over()
	pass # Replace with function body.
