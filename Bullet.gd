extends Area2D


var damage = 110
var speed = 350

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	print("Impact!" + str(body))
	body.get_hit(damage)
	body.stop_moving()
	queue_free()
