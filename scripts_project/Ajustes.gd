extends Node
#ajustes del juego
@onready var musica_slider = get_node("GridContainer/slidervolmusica")
@onready var efectos_slider = get_node("GridContainer/slidervolefectos")
@onready var modo_pantalla = get_node("GridContainer/modoventana")

var menu_offline = MenuPrincipalOffline

func _on_modoventana_item_selected(index):
	ConfiguracionGlobal.toggle_fullscreen()

func _on_slidervolmusica_value_changed(value):
	ConfiguracionGlobal.update_volume_music(1, value)

func _on_slidervolefectos_value_changed(value):
	ConfiguracionGlobal.update_volume_music(2, value)

func _on_volvermenu_pressed():
	if menu_offline.switch_window:
		get_tree().change_scene_to_file("res://scenes/menuPrincipalOffline.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
