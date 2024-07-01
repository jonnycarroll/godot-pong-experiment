extends Node
class_name PaddleController

const INITIAL_PADDLE_MOVEMENT_SPEED : float = 750.0
var paddle_movement_speed : float = INITIAL_PADDLE_MOVEMENT_SPEED

var paddle : Paddle
var ball : RigidBody2D

var ball_starting_position : int
var paddle_start_position_x : float
var paddle_shunt_position_x : float

const RESET_SHUNT_DELAY : float = 0.0
const MAX_SHUNT_DELAY : float = 0.4
const SHUNT_MOVEMENT_SPEED : float = 15
var shuntDelay : float = RESET_SHUNT_DELAY
var is_shunting : bool = false
var is_shunt_returning : bool = false

func _init(new_paddle : Paddle, new_ball : RigidBody2D):
	paddle = new_paddle
	ball = new_ball
	ball_starting_position = sign(ball.position.x - paddle.position.x)
	paddle_start_position_x = paddle.position.x
	paddle_shunt_position_x = paddle.position.x + 100.0 * ball_starting_position

func move_the_paddle(delta) -> Vector2:
	return Vector2.ZERO

func shunt_the_paddle():
	if is_shunting:
		paddle.position.x = move_toward(paddle.position.x, paddle_shunt_position_x, SHUNT_MOVEMENT_SPEED)
		
		if ball_starting_position > 0 && paddle.position.x >= paddle_shunt_position_x \
		|| ball_starting_position < 0 && paddle.position.x <= paddle_shunt_position_x:
			is_shunt_returning = true
		
	if is_shunt_returning:
		paddle.position.x = move_toward(paddle.position.x, paddle_start_position_x, SHUNT_MOVEMENT_SPEED * 2)
		
		if ball_starting_position > 0 && paddle.position.x <= paddle_start_position_x \
		|| ball_starting_position < 0 && paddle.position.x >= paddle_start_position_x:
			is_shunting = false
			is_shunt_returning = false
			paddle.position.x = paddle_start_position_x

func increase_paddle_movement_speed(magnitude : float):
	paddle_movement_speed *= magnitude

func reset_paddle_movement_speed():
	paddle_movement_speed = INITIAL_PADDLE_MOVEMENT_SPEED
