extends CharacterBody2D


var velocidad: int = 80
var vel_perseguir: int = 140
var perseguir: bool = false


func _ready():
	$snake2D.play("run_snake")
	velocity.x = -velocidad

func _physics_process(delta):
	detectar()
	if !perseguir:
		if is_on_wall():
			if !$snake2D.flip_h:
				velocity.x = velocidad
			else:
				velocity.x = -velocidad
			
	
	if velocity.x <0:
		$snake2D.flip_h = false
	elif velocity.x > 0:
		$snake2D.flip_h = true
		
	move_and_slide()
	
	
	if(get_slide_collision(get_slide_collision_count()-1) != null):
		var obj_col = get_slide_collision(get_slide_collision_count()-1).get_collider()
		if(obj_col.is_in_group("player")):
			pass
	

func detectar():
	if $rigth.is_colliding():
		var obj = $rigth.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = vel_perseguir
			$snake2D.flip_h = true
		else: 
			perseguir = false


	if $left.is_colliding():
		var obj = $left.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = -vel_perseguir
			$snake2D.flip_h = false
		else: 
			perseguir = false
			
