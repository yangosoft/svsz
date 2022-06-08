extends "res://SomethingShooter.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	print("INIT!")
	star_cost = 75
	armour = 3
	strength = 100
	life = 50
	attack_cadence_ms = 3000
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000
	

# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Catapult")
	bullet = load("res://BulletCatapult.tscn")
	add_to_group("defender")
	#self.shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
