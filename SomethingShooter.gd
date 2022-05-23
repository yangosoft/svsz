extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	print("Shooter!!!!")
	armour = 3
	strength = 110
	bullet = load("res://Bullet.tscn")
	shoot()
	
func shoot():
	var b = bullet.instance()
	add_child(b)
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_unix_time()
	if ( now - last_attack ) < attack_cadence_seconds:
		return
	shoot()
	last_attack = now

