extends "res://SomethingShooter.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lst_enemies = Array()
var current_enemy_idx = 0


func _init():
	star_cost = 1
	armour = 3
	strength = 10
	attack_cadence_ms = 300
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ShooterElectric")
	bullet = load("res://BulletBig.tscn")
	add_to_group("defender")
	
	
func shoot():
	var b = bullet.instance()
	
	
	
	if lst_enemies.size() == 0:
		return

	
	if current_enemy_idx >= lst_enemies.size():
		current_enemy_idx = 0 
	
	var e = lst_enemies[current_enemy_idx]
	if is_instance_valid(e):
		var x = abs(self.position.x - e.position.x)
		if x == 0:
			x = 0.1
		var y = self.position.y - e.position.y
		var s = 1
		if y < 0:
			b.speed = -b.speed
		y = abs(y)
		var alpha = atan(y/x)
		
		b.set_rotation(alpha)
		b.add_to_group("bullet")
		add_child(b)
		
	current_enemy_idx += 1	
		
	
	
	
   

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_ticks_msec()
	if ( now - last_attack ) < current_attack_cadence_ms:
		return
	
	if OS.get_ticks_msec() - last_dope_ms > 5000:
		current_attack_cadence_ms = attack_cadence_ms
		$TextureRect.show()
	
	var enemies = get_tree().get_nodes_in_group("line_"+str(line_position)) 
	
	if enemies.size() > 0:
		var my_pos = position
		
		for e in enemies:
			if e.is_dying == false:
				var pos = e.position
				print("My pos " + str(my_pos) + " vs " + str(pos))
				if pos[0] > my_pos[0]: 
					shoot()
					break
		last_attack = now



func _on_AttackArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Attack area entered " + str(area))
	if lst_enemies.has(area) == false:
		lst_enemies.push_back(area)
	pass # Replace with function body.


func _on_AttackArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	var idx = lst_enemies.find(area)
	if idx >= 0:
		lst_enemies.remove(idx)
	pass # Replace with function body.
