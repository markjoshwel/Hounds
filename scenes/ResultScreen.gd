extends Control


signal game_quit


func show_screen(text: String) -> void:
	$ColorRect/CenterContainer/VBoxContainer/ResultLabel.text = text
	get_tree().paused = true
	visible = true


func _on_button_exit_pressed() -> void:
	get_tree().quit()


func _on_button_back_pressed() -> void:
	get_tree().paused = false
	visible = false
	emit_signal("game_quit")
