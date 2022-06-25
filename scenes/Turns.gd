extends Control


signal no_more_turns


var turns: int = 1:
	get:
		return turns
	set(value):
		if turns == 30:
			emit_signal("no_more_turns")
		else:
			turns = value


func _process(_delta: float) -> void:
	$TurnsLabelTop.text = str(turns) + "/30"
	$TurnsLabelBottom.text = str(turns) + "/30"
