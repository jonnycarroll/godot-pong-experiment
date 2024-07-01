extends RigidBody2D
class_name Paddle

var controller : PaddleController
var velocity : Vector2 = Vector2.ZERO

func _physics_process(delta):
	move_and_collide(controller.move_the_paddle(delta) * delta)
