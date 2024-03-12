extends TextureRect

@onready var animation = $Anima
@onready var textodialo = $texto

const texto_nota : Array =[
	"Ehh, me duele la cabeza", #0
	"¿Qué pasó?",
	"¿Me quedé dormdido?",
	"¿Dondé estoy?",
	
]

var indiceTexto = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.get_node("Musica").stream = load("res://Musica/Ludum-Dare-28-Track-6.ogg")
	Audio.get_node("Musica").play()
	_ponerText(texto_nota[indiceTexto])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _ponerText(TEXTO:String) -> void:
	textodialo.text = TEXTO
	animation.play("texto")


func _on_anima_animation_finished(anim_name):
	animation.play("boton")
	
	
func _input(event):
	if Input.is_action_pressed("Interactuar"):
		if indiceTexto < texto_nota.size() - 1:
			indiceTexto += 1
			_ponerText(texto_nota[indiceTexto])
		else:
			get_tree().change_scene_to_file("res://scenes/interiorCasa.tscn")
			pass
