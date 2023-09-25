extends CharacterBody2D

const MAX_SPEED = 200

func _ready():
	pass

func _process(_delta):
	var direction = get_movement_vector().normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_movement_vector() -> Vector2:
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)