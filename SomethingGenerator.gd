extends "res://SomethingBarrier.gd"



var num_seconds_to_gen = 10
var now = OS.get_unix_time()
var last_gen = 0
var last_particle = 0


func _init():
	armour = 3
	strength = 30
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
		#$TextureRect.show()
		$Particles2D.emitting = true
		last_particle = OS.get_unix_time()
	
	if now - last_particle >= 2:
		$Particles2D.emitting = false
	
