extends "res://Something.gd"



var movement_ms = 30
var last_movement_ms = 0

var enemies = []
var is_moving = false

func _init():
	life = 99999
	strength = 900000
	attack_cadence_ms = 0
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$BgColorRect.hide()
	$ColorRect.hide()
	print("Police added!")
	add_to_group("defender")
	pass # Replace with function body.


func _process(delta):
	var now = OS.get_ticks_msec()
	
	if is_attacking and is_instance_valid(enemy) and enemy.is_queued_for_deletion() == false and enemy.is_dying == false:
		attack(null)
		
	
	if is_moving and now - last_movement_ms > movement_ms:
		var pos = self.position
		pos[0] = pos[0] + 1
		self.position = pos
		last_movement_ms = now
		if pos[0] > 1400:
			call_deferred("queue_free")
			
	for enemy in enemies:
		if enemy != null and is_instance_valid(enemy):
			enemy.get_hit(strength)
			
	enemies.clear()
	
func _on_AnimatedSprite_body_entered(area):
	print("Body entered: " + str(area))
	if area.is_in_group("enemy"):
		is_moving = true
		enemy = area
		enemies.push_back(area)
	
	
func _on_AnimatedSprite_area_entered(area):
	print("Area entered: " + str(area))
	if area.is_in_group("enemy"):
		is_moving = true
		enemy = area
		enemies.push_back(area)
		
		if enemy.is_dying:
			enemy = null
		is_attacking = true
		emit_signal("something_hit") 	
