extends CharacterBody2D
var speed:=190
var direction:=0
var jump := 240
const gravity := 9
@onready var anim:= $AnimatedSprite2D
@onready var sprite:= $Sprite2D

func _physics_process(delta):
	direction = Input.get_axis("ui_left","ui_right")
	velocity.x = direction * speed
	
	if direction != 0:
		anim.play("walk_burger")
	else:
		anim.play("idle_burger")
		
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump 
		
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 0:
			anim.play("jump_burger")
		else:
			anim.play("fall_burger")
		
	move_and_slide()
	
	if(get_slide_collision(get_slide_collision_count()-1) != null):
		var obj_col = get_slide_collision(get_slide_collision_count()-1).get_collider()
		if(obj_col.is_in_group("enemies")):
			var vida3 = $"../monedas/Vida_3"
			var vida2 = $"../monedas/Vida_2"
			var vida1 = $"../monedas/Vida_1"
			
			if vida3.visible:
				vida3.visible = false
			elif vida2.visible:
				vida2.visible = false
			elif vida1.visible:
				vida1.visible = false
				
