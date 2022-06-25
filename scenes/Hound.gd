extends Area2D


signal change_hound_focus(hound: int)


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_hound_1_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("change_hound_focus", 1)


func _on_hound_2_input_event(viewport, event, shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("change_hound_focus", 2)


func _on_hound_3_input_event(viewport, event, shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("change_hound_focus", 3)
