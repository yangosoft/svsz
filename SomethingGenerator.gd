extends "res://SomethingBarrier.gd"



var num_seconds_to_gen = 10
var now = OS.get_unix_time()
var last_gen = 0


func _init():
	armour = 3
	strength = 50
	star_cost = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Generator")
	
	add_to_group("defender")
	$TextureRect.hide()
	last_gen = now
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_unix_time()
	if now - last_gen > num_seconds_to_gen:
		emit_signal("gen_star")
		get_parent().emit_signal("gen_star")
		last_gen = now
		$TextureRect.show()
	
