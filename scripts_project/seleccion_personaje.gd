extends Node
@onready var char = $TextureRect2
@onready var check1 =$Check1
@onready var check2 = $Check2
@onready var check3 = $Check3
var ischeck = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_btn_avent_pressed():
	if ischeck:
		check1.visible = true
		ischeck = false
	else:
		check1.visible = false
		ischeck = true


func _on_btn_invest_pressed():
	if ischeck:
		check2.visible = true
		ischeck = false
	else:
		check2.visible = false
		ischeck = true


func _on_btn_profe_pressed():
	if ischeck:
		check3.visible = true
		ischeck = false
	else: 
		check3.visible = false
		ischeck = true


func _on_btn_cmz_partida_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo_real.tscn")
