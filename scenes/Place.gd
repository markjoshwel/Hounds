extends Area2D

func _process(_delta: float) -> void:
	if visible:
		rotate(0.01)
