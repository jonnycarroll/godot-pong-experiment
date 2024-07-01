extends CanvasLayer

@onready var left_paddle_name : Label = $MarginContainer/HBoxContainer/LeftPaddle/Name
@onready var left_paddle_score : Label = $MarginContainer/HBoxContainer/LeftPaddle/Score
@onready var right_paddle_name : Label = $MarginContainer/HBoxContainer/RightPaddle/Name
@onready var right_paddle_score : Label = $MarginContainer/HBoxContainer/RightPaddle/Score

var left_score : int = 0
var right_score : int = 0

func _process(_delta):
	update_scoreboard()

func _on_abstract_level_game_started(left_player : Player, right_player : Player):
	reset_score()
	left_paddle_name.text = left_player.name
	right_paddle_name.text = right_player.name

func _on_abstract_level_goal_scored(goal_on_left):
	if goal_on_left: right_score += 1
	else: left_score += 1

func reset_score():
	left_score = 0
	right_score = 0

func update_scoreboard():
	left_paddle_score.text = str(left_score)
	right_paddle_score.text = str(right_score)
