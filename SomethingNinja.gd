extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	print("INIT!")
	something_name = "Ninja"
	star_cost = 50
	armour = 3
	strength = 10
	life = 150 
	attack_cadence_ms = 800
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000
	description = "[b]"+something_name+"[/b] is fast and strong. Will hit the enemies fast!\nIt costs " + str(star_cost) + " stars"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func attack(_zombie):
	$AnimatedSprite.play("attack")
	$AudioStreamPlayer.play()
	if null == enemy:
		return
	print("Attacking!")
	enemy.get_hit(strength)
	if enemy.is_dying:
		enemy = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
