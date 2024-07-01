extends PaddleController
class_name HumanPaddleController

func get_player() -> Player:
	return Player.new("Human")

func move_the_paddle(delta) -> Vector2:
	var velocity : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y = Vector2.UP.y
	elif Input.is_action_pressed("down"):
		velocity.y = Vector2.DOWN.y
	
	shuntDelay += delta
	if !is_shunting && Input.is_action_pressed("shunt") && shuntDelay > MAX_SHUNT_DELAY:
		is_shunting = true
		shuntDelay = RESET_SHUNT_DELAY
	
	if is_shunting:
		shunt_the_paddle()
	
	return velocity * paddle_movement_speed
