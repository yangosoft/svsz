extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _init():
	armour = 3
	strength = 200
	life = 300
	star_cost = 5
	

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Barrier!!!!")
	armour = 3
	strength = 200
	star_cost = 5
	
	add_to_group("defender")
	
	
func shoot():
	pass
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

