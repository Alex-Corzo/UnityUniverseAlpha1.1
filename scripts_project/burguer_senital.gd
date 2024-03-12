extends CharacterBody2D
@onready var anim2 = $sprite_burger_anim

const SPEED = 130

func _physics_process(delta):

	# Handle Movement.
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("derecha"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("izquierda"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("abajo"):
		direction.y += 1
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("arriba"):
		direction.y -= 1

	# Normalize the direction vector to avoid diagonal movement being faster.
	direction = direction.normalized()

	# Move the character based on the direction and speed.
	velocity = direction * SPEED
	
	if direction.y == +1:
		anim2.play("walk_burger2")
	elif direction.x == +1:
		anim2.play("right_burger")
	elif direction.x == -1:
		anim2.play("left_burger")
	elif direction.y == -1:
		anim2.play("up_burger")
	else:
		anim2.play("idle_burger2")
		

	move_and_slide()
