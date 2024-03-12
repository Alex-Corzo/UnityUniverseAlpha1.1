extends Control

#Regresar a la pantalla principal
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/ventana_principal.tscn")

#Envia al formulario de recuperar contraseña
func _on_password_recovery_button_pressed():
	get_tree().change_scene_to_file("res://scenes/form_email.tscn")

#Firebase tokens
var webApiKey = "AIzaSyD90kygcVVOandNsArYfMa8yZTmjBsH3_o"
var loginUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="

#Variables para almacenar el estado de sesión
var remember_me = false # CheckBox

# Directorio user data
var dir = OS.get_user_data_dir()

#Función login
func _login(auth_token: String, email: String, password: String):
	var http = $HTTPRequest
	#var jsonObject = JSON.new()
	var body = JSON.stringify({'email' : email, 'password' : password})
	var headers = ['Content-Type: application/json']
	var error = await http.request(auth_token, headers, HTTPClient.METHOD_POST, body)

#Al completar la solicitud HTTP, esta función procesa la respuesta de la API de Firebase
func _on_http_request_request_completed(_result, response_code, _headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	
	# Referencia al Label de validación
	var validMessage = $VBoxContainer/labelValidacion
	# Hacemos visible el label
	validMessage.visible = true
	
	# Si la validación es  correcta
	if (response_code == 200):
		print(response)
		
		# Si el checkbox está marcado, guardar el token de autenticación en memoria persistente
		if(remember_me):
			
			var file = FileAccess.open(dir + "/login_token.txt", FileAccess.WRITE)
			file.store_string(loginUrl + webApiKey)
			file = null
		
		get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
	else:
		#Muestra un mensaje de error en el label
		print(response.error)
		validMessage.modulate = Color(1, 0.5, 0.5)
		validMessage.text = response.error.message
		# Refrescamos campos de texto
		_refresh_fields()

#Función para validar datos al presionar el botón
func _on_inicio_sesion_button_pressed():
	var auth_token = loginUrl + webApiKey
	var email = $VBoxContainer/correoInput.text # recuperar el texto del campo correoInput
	var password = $VBoxContainer/contrasenaInput.text # recuperar el texto del campo contrasenaInput
	_login(auth_token, email, password)

# Refrescar campos de texto
func _refresh_fields():
	var email_edit = $VBoxContainer/correoInput
	var password_edit = $VBoxContainer/contrasenaInput
	email_edit.text = ""
	password_edit.text = ""

func _on_sesion_check_box_pressed():
	remember_me = $VBoxContainer/BoxContainerSesionAct/BoxContSesionAct/sesionCheckBox
