extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "You lost!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$VBoxContainer.show()
	
func show_game_win():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "You win!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$VBoxContainer.show()


func update_score(score):
	$ScoreLabel.text = str(score)

func start_new_game(difficulty):
	$AudioStreamPlayer.play()
	$VBoxContainer.hide()
	$Version.hide()
	emit_signal("start_game",difficulty)
	
func _on_StartButton_pressed():
	start_new_game(3)

func _on_StartButton2_pressed():
	start_new_game(2)
	
func _on_StartButton3_pressed():
	start_new_game(1)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()



