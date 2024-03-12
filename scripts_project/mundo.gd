extends Node
@onready var cartel = $cartel
@onready var anim_puerta = $anim_puerta
@onready var arrow = $arrow_up
@onready var areaPuerta = $area_puerta
@onready var areaCartel = $cartel_2/area_cartel2
@onready var cartel2 =$texto_cartel2
@onready var texto2 = $texto_enem
var cabEnterPB = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.get_node("Musica").stream = load("res://Musica/A Journey Awaits.ogg")
	Audio.get_node("Musica").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_sign_body_entered(body):
	cartel.visible = true

func _on_area_sign_body_exited(body):
	cartel.visible = false

func _on_fuera_mapa_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/interiorCasa.tscn")


func _on_area_puerta_body_entered(body):
	if areaPuerta.get_overlapping_bodies().find(get_tree().get_current_scene().get_node("burger")) != -1:
		arrow.visible = true
		anim_puerta.play("move_arrow")
		cabEnterPB = true


func _on_area_puerta_body_exited(body):
	arrow.visible = false
	cabEnterPB = false

func _input(event):
	if event.is_action_pressed("arriba") or event.is_action_pressed("ui_up"):
		if cabEnterPB:
			get_tree().change_scene_to_file("res://scenes/PB_casa.tscn")



func _on_area_cartel_2_body_entered(body):
	if areaCartel.get_overlapping_bodies().find(get_tree().get_current_scene().get_node("burger")) != -1:
		cartel2.visible = true
		texto2.visible =  true


func _on_area_cartel_2_body_exited(body):
	cartel2.visible = false
	texto2.visible =  false
	

func _on_nxt_level_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/seleccion_personaje.tscn")


func _on_area_salto_body_entered(body):
	if $"señal_salto/area_salto".get_overlapping_bodies().find(get_tree().get_current_scene().get_node("burger")) != -1:
		$"señal_salto/texto_salto".visible = true
		$"señal_salto/Label".visible = true


func _on_area_salto_body_exited(body):
	$"señal_salto/texto_salto".visible = false
	$"señal_salto/Label".visible = false
