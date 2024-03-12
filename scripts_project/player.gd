extends CharacterBody2D

var speed:=100
var direction:=0
var jump := 250
const gravity := 10
@onready var anim:= $AnimationPlayer
@onready var sprite:= $Sprite2D


func _physics_process(delta):
	direction = Input.get_axis("ui_left","ui_right")
	velocity.x = direction * speed
	
	if direction != 0:
		anim.play("walk")
	else:
		anim.play("idle")
		
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump 
		
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 0:
			anim.play("fall")
		else:
			anim.play("jump")
		
	move_and_slide()
