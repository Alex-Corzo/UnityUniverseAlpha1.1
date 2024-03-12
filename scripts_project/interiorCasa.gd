extends Node

@onready var modulo = $CanvasModulate
@onready var fade = $CanvasModulate/fades
@onready var texto = $cursor/AnimationPlayer
@onready var papel = $hoja
@onready var area = $cartaArea
# Called when the node enters the scene tree for the first time.
func _ready():
	texto.play("flecha_text")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/PB_casa.tscn")



func _on_carta_area_body_entered(body: Node) -> void:
	pass

func _input(event):
	if event.is_action_pressed("Interactuar"):
		var interact_area = get_node("cartaArea")
		if interact_area.get_overlapping_bodies().find(get_tree().get_current_scene().get_node("burger_2d")) != -1:
			papel.visible = true
		else:
			papel.visible = false

