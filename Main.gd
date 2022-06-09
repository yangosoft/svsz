extends "res://GameLogic.gd"







func _ready():
	randomize()
	for i in range(60):
		defense_map.append(false)



func _on_MobTimer_timeout():
	add_enemy()
	
	
func _on_ScoreTimer_timeout():
	on_ScoreTimer_timeout()
	
func change_bg():
	var r = rand_range(0,1)
	if r  <= 0.25:
		$Background.texture = load("res://art/bg/bg-1.png")	
	elif r > 0.25 and r<0.5:
		$Background.texture = load("res://art/bg/bg-2.png")
	elif r >= 0.25 and r<0.75:
		$Background.texture = load("res://art/bg/bg-3.png")
	else:
		$Background.texture = load("res://art/bg/bg-4.png")

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	$MadnessTimer.start()


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
	
func prepare_last_barriers():
	print("LÑAST BARREIRS!")
	
		
	last_barrier_array.clear()
	var p = load("res://SomethingPoliceCar.tscn")
	for i in range(6):
		
		var s = p.instance()
		s.position[0] = 150
		s.position[1] = 150+(i*100)
		last_barrier_array.push_back(s)
		add_child(s)
	




func _on_AddPolice_pressed():
	prepare_last_barriers()
	pass # Replace with function body.


func _on_MadnessTimer_timeout():
	$MobTimer.wait_time = 3
	pass # Replace with function body.
