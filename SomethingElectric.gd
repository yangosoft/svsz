extends "res://SomethingShooter.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lst_enemies = Array()
var current_enemy_idx = 0


func _init():
	something_name = "Electric"
	star_cost = 125
	armour = 3
	strength = 10
	attack_cadence_ms = 2000
	current_attack_cadence_ms = attack_cadence_ms
	dope_candence_ms = 10000
	description = "[b]"+something_name+"[/b] attacks the enemy with electricity. It will cover a huge area around him.\nIt costs " + str(star_cost) + " stars"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ShooterElectric")
	bullet = load("res://BulletElectric.tscn")
	add_to_group("defender")
	
	
func shoot():
	print("shoot()")
	
	var b = bullet.instance()
	b.speed = 60
	
	
	if lst_enemies.size() == 0:
		return

	
	if current_enemy_idx >= lst_enemies.size():
		current_enemy_idx = 0 
	
	var e = lst_enemies[current_enemy_idx]
	if is_instance_valid(e):
		var x = self.position.x - e.position.x
		x = abs(x)
		if x == 0:
			x = 0.1
		var y = self.position.y - e.position.y
		
		y = abs(y)
		var alpha = 2*PI - atan(y/x)
		
		if self.position.x > e.position.x and self.position.y < e.position.y:
			alpha = PI- atan(y/x)
		elif self.position.x < e.position.x and self.position.y < e.position.y:
			alpha = 2*PI + atan(y/x)
		elif self.position.x > e.position.x and self.position.y > e.position.y:
			alpha = PI+ atan(y/x)
		
		print("alpha: " + str(alpha))
		
		
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
	
	if lst_enemies.size() > 0:
		shoot()
		last_attack = now



func _on_AttackArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Attack area entered " + str(area))
	if area.is_in_group("enemy"):
		if lst_enemies.has(area) == false:
			lst_enemies.push_back(area)
			is_attacking = true
	pass # Replace with function body.


func _on_AttackArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	var idx = lst_enemies.find(area)
	if idx >= 0:
		lst_enemies.remove(idx)
	pass # Replace with function body.
	
	

