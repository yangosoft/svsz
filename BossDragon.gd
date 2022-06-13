extends "res://ZombieSprite.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var go_down = true
var bullet = null

func _init():
	self.life = 150000
	self.strength = 4
	self.movement_ms = 40
	self.score_points = 3000
	self.is_attacking = true
	self.attack_cadence_seconds = 7
	bullet = load("res://EnemyBulletBig.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_attacking:
		var now = OS.get_unix_time()
		if ( now - last_attack ) < attack_cadence_seconds:
			return
		shoot()
		last_attack = now
		if is_instance_valid(target):
			target.get_hit(self.strength)
		
	elif is_dying == false:
		pass
		# self.linear_velocity = old_lineal_velocity
	var pos = self.position
	if is_moving == true:
		var now = OS.get_ticks_msec()
		if now - last_movement_ms > movement_ms:
			
			if go_down:
				pos[1] = pos[1] - 7
			else:
				pos[1] = pos[1] + 7
			self.position = pos
			self.line_number = int(pos[1]/100.0) 
			last_movement_ms = now
		if pos[1] > 600 and go_down == false:
			print("POS >600 go_down true " + str(pos[1]) )
			go_down = true
		if pos[1] < 60 and go_down == true:
			print("POS <100 go_down true "+ str(pos[1]))
			go_down = false
	
	if was_hit:
		self.modulate.a = 0.5 if Engine.get_frames_drawn() % 2 == 0 else 1.0
		total_during_hit += delta
		if total_during_hit > 0.5:
			was_hit = 0
			total_during_hit = 0
	else:
		self.modulate.a = 1.0



	
	
func shoot():
	print("SHOOT!!!!!")
	var b = bullet.instance()
	#b.add_to_group("bullet")
	add_child(b)
