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

export var attack_cadence_ms = 1100
var current_attack_cadence_ms = attack_cadence_ms
var star_cost = 10
export var is_dopped = false
export var is_attacking = false
var is_dying = false

var enemy = null
var last_attack = 0

export var line_position = -1
export var index_in_map = -1

var last_dope_ms = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_attack_cadence_ms = attack_cadence_ms
	$AnimatedSprite.play("idle")
	add_to_group("defender")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_ticks_msec()
	if ( now - last_attack ) < current_attack_cadence_ms:
		return
	
	if is_attacking and is_instance_valid(enemy) and enemy.is_queued_for_deletion() == false and enemy.is_dying == false:
		attack(null)
		last_attack = now
		
	if is_attacking and is_instance_valid(enemy) == false:
		is_attacking = false
		$AnimatedSprite.play("idle")

	if OS.get_ticks_msec() - last_dope_ms > 5000:
		current_attack_cadence_ms = attack_cadence_ms
		if is_instance_valid($TextureRect):
			$TextureRect.show()
#	pass

func die():
	pass
	
func attack(_zombie):
	$AnimatedSprite.play("attack")
	if null == enemy:
		return
	print("Attacking!")
	enemy.get_hit(strength)
	if enemy.is_dying:
		enemy = null
	
	
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
	emit_signal("something_hit") 

func get_hit(strength_):
	print("Got hit: " + str(strength_))
	self.life -= strength_
	
	var size = Vector2( (life * 50) / 100.0 ,5)
	$ColorRect.set_size(size)
	
	if self.life <= 0:
		is_dying = true
		$AnimatedSprite.stop()
		$AnimatedSprite.play("die") 
		


func _on_AnimatedSprite_animation_finished():
	if is_dying:
		hide()
		get_parent().emit_signal("defense_die",index_in_map)
		call_deferred("queue_free")
	


func _on_AnimatedSprite_area_entered(area):
	if area.is_in_group("enemy"):
		enemy = area
		is_attacking = true
		emit_signal("something_hit") 
	pass # Replace with function body.


func _on_AnimatedSprite_area_exited(area):
	pass # Replace with function body.


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		current_attack_cadence_ms = 500
		last_dope_ms = OS.get_ticks_msec()
		$TextureRect.hide()
	pass # Replace with function body.
