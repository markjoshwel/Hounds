extends Control


signal game_quit


var is_paused: bool = false:
	get:
		return is_paused
	set(value):
		is_paused = value
		visible = is_paused
		get_tree().paused = is_paused


func _input(event) -> void:
	if event.is_action_pressed("pause"):
		is_paused = !is_paused


func _on_button_resume_pressed() -> void:
	self.is_paused = false


func _on_button_exit_pressed() -> void:
	get_tree().quit()


func _on_button_menu_pressed() -> void:
	self.is_paused = false
	emit_signal("game_quit")
