extends Node

@onready var datosizq = $Datos1
@onready var datosder = $Dato2
@onready var estizq = $Est1
@onready var estder = $Est2
@onready var extraizq = $Ex1
@onready var extrader = $Ex2
@onready var logizq = $Log1
@onready var logder = $Log2


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")




# Directorio user data
var dir = OS.get_user_data_dir()






func _on_btn_cerrar_sesin_pressed():
	var file = FileAccess.open(OS.get_user_data_dir() + "/login_token.txt", FileAccess.READ)
	if file != null:
		file = FileAccess.open(OS.get_user_data_dir() + "/login_token.txt", FileAccess.WRITE)
		file.store_string("")
		file = null
	get_tree().change_scene_to_file("res://scenes/ventana_principal.tscn")


func _on_editardatos_mouse_entered():
	datosizq.visible = true
	datosder.visible = true

func _on_editardatos_mouse_exited():
	datosizq.visible = false
	datosder.visible = false
	

func _on_estadisticas_mouse_entered():
	estizq.visible = true
	estder.visible = true


func _on_estadisticas_mouse_exited():
	estizq.visible = false
	estder.visible = false


func _on_extras_mouse_entered():
	extraizq.visible = true
	extrader.visible = true


func _on_extras_mouse_exited():
	extraizq.visible = false
	extrader.visible = false


func _on_logros_mouse_entered():
	logizq.visible = true
	logder.visible = true

func _on_logros_mouse_exited():
	logizq.visible = false
	logder.visible = false
