extends "res://SomethingShooter.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _init():
	star_cost = 30
	armour = 3
	strength = 100
	


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ShooterBIG")
	bullet = load("res://BulletBig.tscn")
	add_to_group("defender")
	
	
func shoot():
	var b = bullet.instance()
	b.add_to_group("bullet")
	add_child(b)
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_ticks_msec()
	if ( now - last_attack ) < current_attack_cadence_ms:
		return
	
	if OS.get_ticks_msec() - last_dope_ms > 5000:
		current_attack_cadence_ms = attack_cadence_ms
		$TextureRect.show()
	
	var enemies = get_tree().get_nodes_in_group("line_"+str(line_position)) 
	
	if enemies.size() > 0:
		var my_pos = position
		
		for e in enemies:
			if e.is_dying == false:
				var pos = e.position
				print("My pos " + str(my_pos) + " vs " + str(pos))
				if pos[0] > my_pos[0]: 
					shoot()
					break
		last_attack = now

