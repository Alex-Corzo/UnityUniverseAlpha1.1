extends Node2D

#const SAVEFILE = "user://SAVEFILE.save"
var dir = OS.get_user_data_dir()

var user_data =  {
	"nombre" : "",
	"apellidoPaterno" : "",
	"nombreDeUsuario" : "",
	"correoElectronico" : ""
}

func _ready():
	load_data()

func load_data():
	var file = FileAccess.open(dir + "/datos_usuarios.save", FileAccess.READ)
	if file == null:
		save_data()
	else:
		user_data = file.get_var()
	save_data()
	file = null

func save_data():
	var file = FileAccess.open(dir + "/datos_usuarios.save", FileAccess.WRITE)
	file.store_var(user_data)
	file = null
