extends "res://Bullet.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var initX =0 
var initY = 0

var total = 0

var t = 0

func _init():
	self.damage = 50
	self.speed = 4
	
	
func _ready():
	initX = self.position.x
	initY = self.position.y
	print("Bullet capult!")
	

func _aphysics_process(delta):
	position += transform.y * speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	

	
	total = 0
		
	var Vx = 10
	var Vy = 7
	var g = 15
	t += delta
	
	var x = Vx * t
	var y = Vy * t - (g * t*t) / 2
	position.y = position.y -y 
	position.x += x
	
	#if (self.position.y > initY):
	#		queue_free()
