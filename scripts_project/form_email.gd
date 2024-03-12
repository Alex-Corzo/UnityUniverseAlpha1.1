extends Control

func _on_regresar_button_pressed():
	get_tree().change_scene_to_file("res://scenes/inicio_de_sesion_correo.tscn")

var webApiKey = "AIzaSyD90kygcVVOandNsArYfMa8yZTmjBsH3_o"
var emailUrl = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key="

func _send_email(url: String, email: String):
	var http = $HTTPRequest
	#var jsonObject = JSON.new()
	var body = JSON.stringify({"requestType": "PASSWORD_RESET","email": email})
	var headers = ["Content-Type: application/json"]
	var error = http.request(url, headers, HTTPClient.METHOD_POST, body)
	if error != OK:
		print("Error al enviar correo de recuperación de contraseña:", error)
	else:
		print("Correo de recuperación de contraseña enviado a:", email)

func _on_ok_button_pressed():
	var url = emailUrl + webApiKey
	var email = $containerBackground/VBoxContainer/emailInput.text
	_send_email(url, email)
