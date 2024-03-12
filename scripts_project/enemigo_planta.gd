extends CharacterBody2D
@onready var animPlant = $planta/anim_planta

func _physics_process(delta):
	animPlant.play("idle_planta")
