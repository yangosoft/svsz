extends "res://SomethingGenerator.gd"



func _init():
	num_seconds_to_gen = 30
	armour = 3
	strength = 30
	star_cost = 15
	life = 20
	dope_candence_ms = 999999999

func _process(delta):
	var now = OS.get_unix_time()
	if now - last_gen > num_seconds_to_gen:
		emit_signal("gen_star")
		get_parent().emit_signal("gen_star")
		
		emit_signal("gen_star")
		get_parent().emit_signal("gen_star")
		
		
		last_gen = now
		#$TextureRect.show()
		$Particles2D.emitting = true
		last_particle = OS.get_unix_time()
	
	if now - last_particle >= 2:
		$Particles2D.emitting = false
