extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_iniciar_part_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogo.tscn")

func _on_btn_ajustes_pressed():
	get_tree().change_scene_to_file("res://scenes/Ajustes.tscn")

@onready var confirm = $confirm_salir
var switch_window =  false

func _on_btn_salir_pressed():
	confirm.visible = true

func _on_confirm_si_pressed():
	get_tree().quit()

func _on_confirm_no_pressed():
	confirm.visible = false

func _on_ready():
	switch_window = true


func _on_instagram_pressed():
	OS.shell_open("https://instagram.com/edfunny_games?igshid=MmJiY2I4NDBkZg==")
