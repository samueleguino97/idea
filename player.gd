extends CharacterBody2D

@export var speed: float = 200.0
@export var acceleration: float = 1500.0
@export var friction: float = 1000.0

func _physics_process(delta: float) -> void:
	# Get input direction (normalized for diagonal movement)
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# Apply acceleration or friction
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	# Rotate to face mouse cursor
	look_at(get_global_mouse_position())

	move_and_slide()
