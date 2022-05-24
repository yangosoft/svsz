extends Area2D

export var life = 100

export var armour = 5
export var strength = 19
export var line_number = 0

var is_attacking = false
var is_dying = false
var is_moving = true
var target = null

var attack_cadence_seconds = 1
var last_attack = 0
var old_lineal_velocity = 0
var was_hit = false
var total_during_hit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# old_lineal_velocity = self.linear_velocity
	$AnimatedSprite.play("walk")
	is_moving = true
	add_to_group("enemy")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_attacking:
		var now = OS.get_unix_time()
		if ( now - last_attack ) < attack_cadence_seconds:
			return
		if is_instance_valid(target):
			last_attack = now
			target.get_hit(self.strength)
		else:
			is_attacking = false
			if is_dying == false:
				$AnimatedSprite.play("walk")
	elif is_dying == false:
		pass
		# self.linear_velocity = old_lineal_velocity
	if is_moving == true:
		var pos = self.position
		pos[0] = pos[0] - 1
		self.position = pos
	
	if was_hit:
		self.modulate.a = 0.5 if Engine.get_frames_drawn() % 2 == 0 else 1.0
		total_during_hit += delta
		if total_during_hit > 0.5:
			was_hit = 0
			total_during_hit = 0
	else:
		self.modulate.a = 1.0


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.

func get_hit(strengh):
	print("Zombie gets hit")
	was_hit = true
	life = life - (strengh)
	print("CUrrent life " + str(life))
	var size = Vector2( (life * 50) / 100.0 ,5)
	$ColorRect.set_size(size)
	
	if life <= 0:
		is_dying = true
		is_moving = false
		is_attacking = false
		print("Time to die")
		$AnimatedSprite.stop()
		$AnimatedSprite.play("die") 
		
func set_target(something_):
	print("ZombieSprite is Setting target " + str(something_))
	if target != something_:
		target = something_
		$AnimatedSprite.stop()
		$AnimatedSprite.play("attack")
		is_attacking = true

func _on_AnimatedSprite_animation_finished():
	if (life <= 0 ):
		hide()
		remove_from_group("line_"+str(line_number))
		#queue_free()
		call_deferred("queue_free")
	

func stop_moving():
	print("stop_moving()0 called")
	#var velocity = Vector2(0,0)
	#self.linear_velocity = velocity.rotated(PI)
	is_moving = false
	

func _on_Zombie_body_entered(body):
	print("ZombieSprite Waiting to keep walking")
	body.stop_moving()
	


func _on_Zombie_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("ZombieSprite Waiting to keep walking2")
	body_rid.stop_moving()

func set_line_number(line):
	line_number = line
	add_to_group("line_"+str(line_number))
	
func get_line_number():
	return line_number


func _on_ZombieSprite_area_entered(area):
	print("ZombieSprite area entered" + str(area))
	if area.is_in_group("bullet") == false:
		is_moving = false
	elif area.is_in_group("enemy"):
		is_moving = false
	if area.is_in_group("defender"):
		is_moving = false
		set_target(area)
		is_attacking = true
	
	
	# stop_moving()
	pass # Replace with function body.



func _on_ZombieSprite_area_exited(area):
	print("Exiting " + str(area))
	if is_attacking == false and area.is_in_group("bullet") == false and is_dying == false:
		is_moving = true
	if is_attacking == true and area.is_in_group("defender"):
		is_attacking = false
		$AnimatedSprite.play("walk")
		is_moving = true
		
	pass # Replace with function body.
