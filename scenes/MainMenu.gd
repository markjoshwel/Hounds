extends Control


func _notification(what: int) -> void:
	if (what == Node.NOTIFICATION_WM_GO_BACK_REQUEST):
		get_tree().quit()


func _on_godot_button_pressed() -> void:
	OS.shell_open("https://godotengine.org/")


func _on_source_button_pressed() -> void:
	OS.shell_open("https://github.com/markjoshwel/Hounds/")


func _on_button_exit_button_up() -> void:
	get_tree().quit()


func _on_button_start_pressed() -> void:
	get_tree().change_scene("res://scenes/Game.tscn")
