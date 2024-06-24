extends "res://GameLogic.gd"



var effectDurationMs = 10*1000
var effectTrigger = 0



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
	$MadnessTimer.wait_time = Global.madness_start
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
	$BtnKillThemAll.show()
	$Particles2D.one_shot = true
	$Particles2D.emitting = false
	last_barrier_array.clear()
	var p = load("res://SomethingPoliceCar.tscn")
	for i in range(6):
		var s = p.instance()
		s.position[0] = 150
		s.position[1] = 150+(i*100)
		last_barrier_array.push_back(s)
		add_child(s)
	

func _on_AddPolice_pressed():
	win_game()
	# prepare_last_barriers()
	pass # Replace with function body.


func process_effects():
	var now = OS.get_ticks_msec()
	if (now - effectTrigger) < effectDurationMs:
		get_tree().call_group("enemy", "queue_free")
	pass

func _on_MadnessTimer_timeout():
	
	if $MobTimer.wait_time != 3:
		$MobTimer.wait_time = 3
		$HUD/ColorRect.color = Color.red
		$AudioMadness.play()
	else:
		$HUD/ColorRect.color = Color.blue
		$AudioMadness.stop()
		if Global.enemy_creator_s - (Global.difficulty*2) > 1:
			$MobTimer.wait_time = Global.enemy_creator_s - (Global.difficulty*2)
		
	pass # Replace with function body.


func _on_BtnKillThemAll_pressed():
	effectTrigger = OS.get_ticks_msec()
	$Particles2D.emitting = true
	$AudioStreamPlayer.stream = load("res://sound/fire_sound_effect.mp3")
	$AudioStreamPlayer.play()
	$BtnKillThemAll.hide()
	get_tree().call_group("enemy", "queue_free")
	pass # Replace with function body.


func _on_BtnKillThemAll2_pressed():
	effectTrigger = OS.get_ticks_msec()
	$particleIce.emitting = true
	$AudioStreamPlayer.stream = load("res://sound/iceaudio.mp3")
	$AudioStreamPlayer.play()
	$BtnKillThemAll2.hide()
	get_tree().call_group("enemy", "queue_free")
	pass # Replace with function body.
