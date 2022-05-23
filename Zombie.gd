extends RigidBody2D

export var life = 100

export var armour = 5
export var strength = 10
export var line_number = 0

var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walk")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.

func get_hit(strengh):
	print("Zombie gets hit")
	life = life - (strengh)
	print("CUrrent life " + str(life))
	if life <= 0:
		print("Time to die")
		$AnimatedSprite.stop()
		$AnimatedSprite.play("die") 
		
func set_target(something_):
	if target != something_:
		target = something_
		$AnimatedSprite.stop()
		$AnimatedSprite.play("attack")

func _on_AnimatedSprite_animation_finished():
	if (life <= 0 ):
		hide()
		queue_free()
	pass # Replace with function body.

func stop_moving():
	var velocity = Vector2(0,0)
	self.linear_velocity = velocity.rotated(PI)

func _on_Zombie_body_entered(body):
	print("Waiting to keep walking")
	body.stop_moving()
	


func _on_Zombie_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("Waiting to keep walking2")
	body_rid.stop_moving()

func set_line_number(line):
	line_number = line
	
func get_line_number():
	return line_number
