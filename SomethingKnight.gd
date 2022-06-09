extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	print("INIT!")
	something_name ="Knight"
	star_cost = 65
	armour = 3
	strength = 35
	life = 200 
	attack_cadence_ms = 900
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000
	description = "[b]"+something_name+"[/b] attacks the enemy with a strong sword.\nIt costs " + str(star_cost) + " stars"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
