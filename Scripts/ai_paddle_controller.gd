extends PaddleController
class_name AiPaddleController

const HALF_PADDLE_DEAD_ZONE = 25
const STANDARD_AI_RESPONSIVENESS : float = 0.85
var ai_responsiveness : float

func _init(new_paddle : Paddle, new_ball : RigidBody2D, responsiveness : float = STANDARD_AI_RESPONSIVENESS):
	super._init(new_paddle, new_ball)
	ai_responsiveness = responsiveness

func get_player() -> Player:
	return Player.new("AI")

func move_the_paddle(delta) -> Vector2:
	var velocity : Vector2 = Vector2.ZERO
	velocity.y = get_ball_position_y() * paddle_movement_speed * ai_responsiveness
	return velocity

func get_ball_position_y() -> int:
	if abs(ball.position.y - paddle.position.y) > HALF_PADDLE_DEAD_ZONE:
		if ball.position.y > paddle.position.y:
			return 1
		else:
			return -1
	else:
		return 0
