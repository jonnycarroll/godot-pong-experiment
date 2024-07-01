extends RigidBody2D
class_name Ball

const SPEED = 1000.0
var reset_position : bool = false

func _integrate_forces(state):
	if reset_position:
		state.transform = Transform2D(0, Vector2(640, randi_range(240, 480)))
		reset_position = false

func launch_ball():
	var launch_direction = Vector2([1, -1].pick_random(), [0.8, -0.8].pick_random())
	linear_velocity = launch_direction * Vector2(SPEED, SPEED)

func position_ball():
	reset_position = true

func stop_ball():
	linear_velocity = Vector2.ZERO
