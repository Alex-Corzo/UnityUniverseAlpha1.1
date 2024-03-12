extends CharacterBody2D

var velocidad: int = 80
var vel_perseguir: int = 140
var perseguir: bool = false

func _ready():
	$anim_slime.play("idle_slime")
	velocity.x = -velocidad
	
	
	
func _physics_process(delta):
	
	if velocity.x <0:
		$slime.flip_h = false
	elif velocity.x > 0:
		$slime.flip_h = true
	move_and_slide()
