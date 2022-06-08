extends "res://GameLogic.gd"







func _ready():
	randomize()
	for i in range(60):
		defense_map.append(false)



func _on_MobTimer_timeout():
	add_enemy()
	
	
func _on_ScoreTimer_timeout():
	on_ScoreTimer_timeout()
	
	

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
	



