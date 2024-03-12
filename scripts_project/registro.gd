extends Control

#Regresar a la pantalla principal
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/ventana_principal.tscn")

#Firebase tokens
var webApiKey = "AIzaSyD90kygcVVOandNsArYfMa8yZTmjBsH3_o"
var signUpUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="

#Declaracion de variables donde se almacenan los datos del usuario
var nombre = SaveData.user_data["nombre"]
var apellidoPaterno = SaveData.user_data["apellidoPaterno"]
var nombreDeUsuario = SaveData.user_data["nombreDeUsuario"]
var correoElectronico = SaveData.user_data["correoElectronico"]

#Función signup
func _signUp(auth_token: String, email: String, password: String):
	var http = $HTTPRequest
	#var jsonObject = JSON.new()
	var body = JSON.stringify({'email' : email, 'password' : password})
	var headers = ['Content-Type: application/json']
	var error = await http.request(auth_token, headers, HTTPClient.METHOD_POST, body)

#Al completar la solicitud HTTP, esta función procesa la respuesta de la API de Firebase
func _on_http_request_request_completed(_result, response_code, _headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	
	#Referencia al Label de validación
	var validMessage = $VBoxContainer/labelValidacion
	#Hacemos visible el label
	validMessage.visible = true
	
	#Si la validación es  correcta
	if (response_code == 200):
		print(response)
		
		#Almacenamos los datos del usuario que están en los campos de texto al archivo de lectura y escritura 
		nombre = $VBoxContainer/nombreInput.text
		apellidoPaterno = $VBoxContainer/apellidoPaternoInput.text
		nombreDeUsuario = $VBoxContainer/nombreUsuarioInput.text
		correoElectronico = $VBoxContainer/emailInput.text
		SaveData.save_data()
		
		#Envia al menú principal del juego
		get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
	else:
		#Muestra un mensaje de error en el label
		print(response.error) 
		validMessage.modulate = Color(1, 0.5, 0.5)
		validMessage.text = response.error.message
		#Refrescamos campos de texto
		_refresh_fields()

#Función para validar datos al presionar el botón
func _on_registro_button_pressed():
	#Datos ingresados en los campos de texto
	var nombre_input = $VBoxContainer/nombreInput.text
	var apellido_input = $VBoxContainer/apellidoPaternoInput.text
	var nombre_usuario_input = $VBoxContainer/nombreUsuarioInput.text
	var email_input = $VBoxContainer/emailInput.text
	var password_input = $VBoxContainer/contrasenaInput.text
	
	#Si algún campo se encuentra vacío no dejará hacer la validación para el registro hasta que se llenen todos los campos
	if nombre_input.is_empty() or apellido_input.is_empty() or nombre_usuario_input.is_empty() or email_input.is_empty() or password_input.is_empty():
		#Muestra un mensaje de error en el label
		var validMessage = $VBoxContainer/labelValidacion
		validMessage.visible = true
		validMessage.modulate = Color(1, 0.5, 0.5)
		validMessage.text = "Por favor, complete todos los campos."
		_refresh_fields()
	else:
		var auth_token = signUpUrl + webApiKey
		_signUp(auth_token, email_input, password_input)

#Refrescar campos de texto
func _refresh_fields():
	var nombre_input_null = $VBoxContainer/nombreInput
	var apellido_input_null = $VBoxContainer/apellidoPaternoInput
	var nombre_usuario_input_null = $VBoxContainer/nombreUsuarioInput
	var email_input_null = $VBoxContainer/emailInput
	var password_input_null = $VBoxContainer/contrasenaInput
	nombre_input_null.text = ""
	apellido_input_null.text = ""
	nombre_usuario_input_null.text = ""
	email_input_null.text = ""
	password_input_null.text = ""
