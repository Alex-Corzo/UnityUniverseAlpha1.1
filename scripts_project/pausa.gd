extends CanvasLayer

@onready var control = $Control
var isPaused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		if isPaused:
			control.visible = false
			get_tree().paused = false
			isPaused = false
		else:
			control.visible = true
			get_tree().paused = true
			isPaused = true


func _on_pausebutton_pressed():
	get_tree().paused = true
	control.visible = true


func _on_button_pressed():
	control.visible = false
	get_tree().paused = false


func _on_button_3_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Ajustes.tscn")


func _on_button_4_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
