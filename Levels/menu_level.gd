extends AbstractLevel
class_name MenuLevel

var simple_level : PackedScene = preload("res://Levels/simple_level.tscn")

func _ready():
	left_paddle.controller = AiPaddleController.new(left_paddle, ball)
	right_paddle.controller = AiPaddleController.new(right_paddle, ball)
	start_game()

func _on_start_game_button_pressed():
	get_tree().change_scene_to_packed(simple_level)
