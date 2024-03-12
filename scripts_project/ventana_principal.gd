extends Control

func _on_email_login_button_pressed():
	get_tree().change_scene_to_file("res://scenes/inicio_de_sesion_correo.tscn")

func _on_registro_button_pressed():
	get_tree().change_scene_to_file("res://scenes/registro.tscn")

func _on_sin_cuenta_login_button_pressed():
	var switch_window = true
	get_tree().change_scene_to_file("res://scenes/menuPrincipalOffline.tscn")
	Audio.get_node("Musica").stream = load("res://Musica/8bit-Bossa.ogg")
	
	Audio.get_node("Musica").play()

# Verifica si la sesión del usuario está activa para entrar automaticamente al menu principal del juego
func _on_ready():
	var file = FileAccess.open(OS.get_user_data_dir() + "/login_token.txt", FileAccess.READ)
	if file != null:
		var file_contents = file.get_as_text()
		if file_contents.find(InicioDeSesionCorreo.loginUrl + InicioDeSesionCorreo.webApiKey) >= 0:
			file = null
			get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
		else:
			file = null
