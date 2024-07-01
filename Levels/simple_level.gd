extends AbstractLevel
class_name SimpleLevel

func _ready():
	var human_on_left = [true,false].pick_random()
	if human_on_left:
		left_paddle.controller = HumanPaddleController.new(left_paddle, ball)
		right_paddle.controller = AiPaddleController.new(right_paddle, ball)
	else:
		left_paddle.controller = AiPaddleController.new(left_paddle, ball)
		right_paddle.controller = HumanPaddleController.new(right_paddle, ball)
	start_game()

#func _physics_process(delta):
#	var collision_object = move_and_collide(velocity * SPEED * delta)
#	if collision_object:
#		velocity = velocity.bounce(collision_object.get_normal())
#		var collider = collision_object.get_collider()
#		if collider is Paddle:
#			paddled.emit()
#			velocity.x *= 1.05

func _on_ball_paddled():
	left_paddle.controller.increase_paddle_movement_speed(1.05)
	right_paddle.controller.increase_paddle_movement_speed(1.05)
