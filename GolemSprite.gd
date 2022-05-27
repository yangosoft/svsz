extends "res://ZombieSprite.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	self.life = 320
	self.strength = 20
	self.movement_ms = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("golem")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
