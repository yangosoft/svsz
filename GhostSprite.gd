extends "res://ZombieSprite.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	self.life = 150
	self.strength = 4
	self.movement_ms = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")
	pass # Replace with function body.
