extends Node
@onready var manita1 = $Manitacont
@onready var manita2 = $Manitacont1
@onready var manita3 =$Manitanuv
@onready var manita4 = $Manitanuv1


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")


func _on_nueva_partida_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogo.tscn")


func _on_continuar_partida_mouse_entered():
	manita1.visible = true
	manita2.visible = true



func _on_continuar_partida_mouse_exited():
	manita1.visible = false
	manita2.visible = false


func _on_nueva_partida_mouse_entered():
	manita3.visible = true
	manita4.visible = true


func _on_nueva_partida_mouse_exited():
	manita3.visible = false
	manita4.visible = false
