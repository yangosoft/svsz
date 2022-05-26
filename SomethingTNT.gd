extends "res://Something.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timestamp = 0
var has_played = false
func _init():
	armour = 3
	strength = 400
	star_cost = 20
	

# Called when the node enters the scene tree for the first time.
func _ready():
	timestamp = OS.get_ticks_msec()
	print("TNT!")
	armour = 3
	strength = 400
	star_cost = 20
	
	add_to_group("defender")
	
	
func shoot():
	pass
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_ticks_msec()
	if now - timestamp > 200:
		$Particles2D.emitting = true
		if has_played == false:
			$AudioStreamPlayer.play()	
			has_played = true
	if now - timestamp > 1200:
		get_parent().emit_signal("defense_die",index_in_map)
		call_deferred("queue_free")

func _on_AnimatedSprite_area_entered(area):
	if area.is_in_group("enemy"):
		area.get_hit(strength)
	
func _on_AnimatedSprite_body_entered(body):
	if body.is_in_group("enemy"):
		body.get_hit(self.strength)
