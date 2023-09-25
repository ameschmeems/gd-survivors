extends CharacterBody2D

const MAX_SPEED = 125
const ACCELERATION_SMOOTHING = 25

func _ready():
	pass

func _process(delta):
	var direction = get_movement_vector().normalized()
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide()

func get_movement_vector() -> Vector2:
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)