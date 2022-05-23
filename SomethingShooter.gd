extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	print("Shooter!!!!")
	armour = 3
	strength = 21
	bullet = load("res://Bullet.tscn")
	
	
func shoot():
	var b = bullet.instance()
	add_child(b)
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_unix_time()
	if ( now - last_attack ) < attack_cadence_seconds:
		return
		
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

