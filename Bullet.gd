extends Area2D


var damage = 5
var speed = 350

func _ready():
	add_to_group("bullet")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	print("Impact!" + str(body))
	body.get_hit(damage)
	# body.stop_moving()
	queue_free()


func _on_Node2D_area_entered(area):
	if area.is_in_group("enemy"):
		_on_Bullet_body_entered(area)
	pass # Replace with function body.
