extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	print("INIT!")
	star_cost = 50
	armour = 3
	strength = 15
	life = 150 
	attack_cadence_ms = 1000
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
