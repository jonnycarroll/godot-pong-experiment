extends Node2D
class_name AbstractLevel

@onready var left_paddle : Paddle = $LeftPaddle
@onready var right_paddle : Paddle = $RightPaddle
@onready var ball : Ball = $Ball

signal game_started(left_player : Player, right_player : Player)
signal goal_scored(goal_on_left : bool)

#var screen_width = DisplayServer.window_get_size().x
#var screen_height = DisplayServer.window_get_size().y
#var half_screen_width = screen_width/2
#var half_screen_height = screen_height/2

func _on_left_goal_body_entered(body):
	if body is Ball:
		score_goal(true)

func _on_right_goal_body_entered(body):
	if body is Ball:
		score_goal(false)

func start_game():
	game_started.emit(left_paddle.controller.get_player(), right_paddle.controller.get_player())
	reset_ball()

func score_goal(goal_on_left : bool):
	goal_scored.emit(goal_on_left)
	reset_paddles()
	reset_ball()

func reset_ball():
	ball.stop_ball()
	ball.position_ball()
	await get_tree().create_timer(0.4).timeout
	ball.launch_ball()

func reset_paddles():
	left_paddle.controller.reset_paddle_movement_speed()
	right_paddle.controller.reset_paddle_movement_speed()
