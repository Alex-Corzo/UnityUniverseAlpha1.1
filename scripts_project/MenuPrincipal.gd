extends Node
@onready var confirm = $confirm_salir
@onready var si = $manosalirconfirm
@onready var no = $ManosalirNo

func _on_iniciarpartida_pressed():
	get_tree().change_scene_to_file("res://scenes/partidas.tscn")

func _on_ajustes_pressed():
	get_tree().change_scene_to_file("res://scenes/Ajustes.tscn")

func _on_mi_perfil_pressed():
	get_tree().change_scene_to_file("res://scenes/miperfil.tscn")

# Variables de los iconos de inicar partida
var icon_l_start_game
var icon_r_start_game

# Variables de los iconos de ajustes
var icon_l_settings
var icon_r_stettings

# Variables de los iconos de mi perfil
var icon_l_my_profile
var icon_r_my_profile

# Variables de los iconos de salir del juego
var icon_l_exit_game
var icon_r_exit_game

func _on_ready():
	# Musica de fondo
	Audio.get_node("Musica").stream = load("res://Musica/8bit-Bossa.ogg")
	
	Audio.get_node("Musica").play()
	
	# Obtener los iconos de iniciar partida
	icon_l_start_game = $TextureRectSGame
	icon_r_start_game = $TextureRect2SGame
	# Ocultar los iconos al inicio
	icon_l_start_game.visible = false
	icon_r_start_game.visible = false
	
	# Obtener los iconos de ajustes
	icon_l_settings = $TextureRectSettings
	icon_r_stettings = $TextureRect2Settings
	# Ocultar los iconos al inicio
	icon_l_settings.visible = false
	icon_r_stettings.visible = false

	# Obtener los iconos de mi perfil
	icon_l_my_profile = $TextureRectMyProfile
	icon_r_my_profile = $TextureRect2MyProfile
	# Ocultar los iconos al inicio
	icon_l_my_profile.visible = false
	icon_r_my_profile.visible = false
	
	# Obtener los iconos de salir del juego
	icon_l_exit_game = $TextureRectExitGame
	icon_r_exit_game = $TextureRect2ExitGame
	# Ocultar los iconos al inicio
	icon_l_exit_game.visible = false
	icon_r_exit_game.visible = false

# Mostrar los iconos de iniciar partida al pasar el cursor por encima del botón
func _on_iniciar_mouse_entered():
	icon_l_start_game.visible = true
	icon_r_start_game.visible = true

# Ocultar los iconos de iniciar partida al quitar el cursor del botón
func _on_iniciar_mouse_exited():
	icon_l_start_game.visible = false
	icon_r_start_game.visible = false

# Mostrar los iconos de ajustes al pasar el cursor por encima del botón
func _on_ajustes_mouse_entered():
	icon_l_settings.visible = true
	icon_r_stettings.visible = true

# Ocultar los iconos de ajustes al quitar el cursor del botón
func _on_ajustes_mouse_exited():
	icon_l_settings.visible = false
	icon_r_stettings.visible = false

# Mostrar los iconos de mi perfil al pasar el cursor por encima del botón
func _on_mi_perfil_mouse_entered():
	icon_l_my_profile.visible = true
	icon_r_my_profile.visible = true

# Ocultar los iconos de mi perfil al quitar el cursor del botón
func _on_mi_perfil_mouse_exited():
	icon_l_my_profile.visible = false
	icon_r_my_profile.visible = false

# Mostrar los iconos de salir del juego al pasar el cursor por encima del botón
func _on_salir_mouse_entered():
	icon_l_exit_game.visible = true
	icon_r_exit_game.visible = true

# Ocultar los iconos de salir del juego al quitar el cursor del botón
func _on_salir_mouse_exited():
	icon_l_exit_game.visible = false
	icon_r_exit_game.visible = false

func _on_salir_pressed():
	confirm.visible = true


func _on_btn_salir_pressed():
	get_tree().quit()


func _on_btn_salir_mouse_entered():
	si.visible = true

func _on_btn_no_salir_mouse_entered():
	no.visible = true

func _on_btn_salir_mouse_exited():
	si.visible = false


func _on_btn_no_salir_mouse_exited():
	no.visible = false


func _on_button_pressed():
	OS.shell_open("https://instagram.com/edfunny_games?igshid=MmJiY2I4NDBkZg==")
