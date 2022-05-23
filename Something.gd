extends Area2D
export(PackedScene) var something
export (PackedScene) var bullet

signal something_hit
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var id = 0
export var life = 100

export var armour = 5
export var strength = 10

export var attack_cadence_seconds = 3

export var is_dopped = false
export var is_attacking = false

var enemy = null
var last_attack = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_unix_time()
	if ( now - last_attack ) < attack_cadence_seconds:
		return
	
	if is_attacking and enemy != null:
		attack(null)
		last_attack = now

#	pass

func die():
	pass
	
func attack(_zombie):
	$AnimatedSprite.play("attack")
	if null == enemy:
		return
	print("Attacking!")
	enemy.get_hit(strength)
	
	
func dope():
	is_dopped = true
	


func _on_AnimatedSprite_body_entered(body):
	print(body.name)
	body.stop_moving()
	
	body.set_target(self)
	# var z = body.get_node("AnimatedSprite")
	# z.stop()
	# z.play("attack")
	enemy = body
	is_attacking = true
	emit_signal("something_hit") # Replace with function body.

func get_hit(strength_):
	print("Got hit: " + str(strength_))
