extends Node
func toggle_fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func update_volume_music(bus_idx, vol):  #-50 min slider
	if vol > -100:
		AudioServer.set_bus_volume_db(bus_idx, vol)
	else:
		AudioServer.set_bus_mute(bus_idx, true)
	# match bus_idx:
	#	0:
