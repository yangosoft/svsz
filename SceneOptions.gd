extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GridContainer/txtStars.text = str(Global.start_num_stars)
	$GridContainer/txtMobTimer.text = str(Global.enemy_creator_s)
	$GridContainer/txtMadness.text = str(Global.madness_start)
	$GridContainer/txtGameDuration.text = str(Global.game_duration_s)
	
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_txtStars_text_changed():
	if (int($GridContainer/txtStars.text) > 5):
		Global.start_num_stars = int($GridContainer/txtStars.text)
	pass # Replace with function body.


func _on_txtMobTimer_text_changed():
	if (int($GridContainer/txtMobTimer.text) > 5):
		Global.enemy_creator_s = int($GridContainer/txtMobTimer.text)
	pass # Replace with function body.


func _on_txtMadness_text_changed():
	if (int($GridContainer/txtMadness.text) > 5):
		Global.madness_start = int($GridContainer/txtMadness.text)
	pass # Replace with function body.


func _on_txtGameDuration_text_changed():
	if (int($GridContainer/txtGameDuration.text) > 30):
		Global.game_duration_s = int($GridContainer/txtGameDuration.text)
	pass # Replace with function body.
