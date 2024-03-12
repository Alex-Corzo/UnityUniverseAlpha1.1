extends Node
@onready var modulo = $CanvasModulate
@onready var fade = $CanvasModulate/fades
@onready var tele1 = $Area_Tele
@onready var textoTele = $teledialogo
# Called when the node enter$Area_Teles the scene tree for the first time.
func _ready():
	modulo.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/interiorCasa.tscn")


func _on_area_2d_2_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/mundo.tscn")


func _on_area_tele_body_entered(body) -> void:
	if tele1.get_overlapping_bodies().find(get_tree().get_current_scene().get_node("TileMap/burger_2d")) != -1:
		textoTele.visible = true
	

func _on_area_tele_body_exited(body) -> void:
	textoTele.visible = false
