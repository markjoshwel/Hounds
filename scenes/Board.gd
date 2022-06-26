extends Node2D


signal hit(place: int)


func _on_place_1_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 1)


func _on_place_2_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 2)


func _on_place_3_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 3)


func _on_place_4_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 4)


func _on_place_5_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 5)


func _on_place_6_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 6)


func _on_place_7_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 7)


func _on_place_8_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 8)


func _on_place_9_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 9)


func _on_place_10_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 10)


func _on_place_11_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("hit", 11)


func hare_potential(
	place: int,
	hound1_place: int,
	hound2_place: int,
	hound3_place: int,
) -> Array[int]:
	var others: Array[int] = [hound1_place, hound2_place, hound3_place]
	var potentials: Array[int] = []
	if place == 1:  # 2, 3, 4
		if not (2 in others):
			$Places/Place2/HarePotential.visible = true
			potentials.append(2)
		if not (3 in others):
			$Places/Place3/HarePotential.visible = true
			potentials.append(3)
		if not (4 in others):
			$Places/Place4/HarePotential.visible = true
			potentials.append(4)

	if place == 2:  # 1, 3, 5, 6
		if not (1 in others):
			$Places/Place1/HarePotential.visible = true
			potentials.append(1)
		if not (3 in others):
			$Places/Place3/HarePotential.visible = true
			potentials.append(3)
		if not (5 in others):
			$Places/Place5/HarePotential.visible = true
			potentials.append(5)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)

	if place == 3:  # 1, 2, 6, 4
		if not (1 in others):
			$Places/Place1/HarePotential.visible = true
			potentials.append(1)
		if not (2 in others):
			$Places/Place2/HarePotential.visible = true
			potentials.append(2)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (4 in others):
			$Places/Place4/HarePotential.visible = true
			potentials.append(4)

	if place == 4:  # 1, 3, 6, 7
		if not (1 in others):
			$Places/Place1/HarePotential.visible = true
			potentials.append(1)
		if not (3 in others):
			$Places/Place3/HarePotential.visible = true
			potentials.append(3)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (7 in others):
			$Places/Place7/HarePotential.visible = true
			potentials.append(7)

	if place == 5:  # 2, 6, 8
		if not (2 in others):
			$Places/Place2/HarePotential.visible = true
			potentials.append(2)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (8 in others):
			$Places/Place8/HarePotential.visible = true
			potentials.append(8)

	if place == 6:  # 2, 5, 8, 3, 9, 4, 7, 10
		if not (2 in others):
			$Places/Place2/HarePotential.visible = true
			potentials.append(2)
		if not (5 in others):
			$Places/Place5/HarePotential.visible = true
			potentials.append(5)
		if not (8 in others):
			$Places/Place8/HarePotential.visible = true
			potentials.append(8)
		if not (3 in others):
			$Places/Place3/HarePotential.visible = true
			potentials.append(3)
		if not (9 in others):
			$Places/Place9/HarePotential.visible = true
			potentials.append(9)
		if not (4 in others):
			$Places/Place4/HarePotential.visible = true
			potentials.append(5)
		if not (7 in others):
			$Places/Place7/HarePotential.visible = true
			potentials.append(7)
		if not (10 in others):
			$Places/Place10/HarePotential.visible = true
			potentials.append(10)

	if place == 7:  # 4, 6, 10
		if not (4 in others):
			$Places/Place4/HarePotential.visible = true
			potentials.append(4)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (10 in others):
			$Places/Place10/HarePotential.visible = true
			potentials.append(10)
	
	if place == 8:  # 5, 6, 9, 11
		if not (5 in others):
			$Places/Place5/HarePotential.visible = true
			potentials.append(5)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (9 in others):
			$Places/Place9/HarePotential.visible = true
			potentials.append(9)
		if not (11 in others):
			$Places/Place11/HarePotential.visible = true
			potentials.append(11)

	if place == 9:  # 8, 6, 10, 11
		if not (8 in others):
			$Places/Place8/HarePotential.visible = true
			potentials.append(8)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(6)
		if not (10 in others):
			$Places/Place10/HarePotential.visible = true
			potentials.append(10)
		if not (11 in others):
			$Places/Place11/HarePotential.visible = true
			potentials.append(11)

	if place == 10:  # 7, 6, 9, 10
		if not (7 in others):
			$Places/Place7/HarePotential.visible = true
			potentials.append(7)
		if not (6 in others):
			$Places/Place6/HarePotential.visible = true
			potentials.append(56)
		if not (9 in others):
			$Places/Place9/HarePotential.visible = true
			potentials.append(9)
		if not (10 in others):
			$Places/Place10/HarePotential.visible = true
			potentials.append(10)

	if place == 11:  # 8, 9, 10
		if not (8 in others):
			$Places/Place8/HarePotential.visible = true
			potentials.append(8)
		if not (9 in others):
			$Places/Place9/HarePotential.visible = true
			potentials.append(9)
		if not (10 in others):
			$Places/Place10/HarePotential.visible = true
			potentials.append(10)
	
	print("hare potentials successful, ", potentials)
	
	return potentials


func hound_potential(
	place: int,
	hound_a_place: int,
	hound_b_place: int,
	hare_place: int,
) -> Array[int]:
	var others: Array[int] = [hound_a_place, hound_b_place, hare_place]
	var potentials: Array[int] = []

	if place == 11:  # 8, 9, 10
		if not (8 in others):
			$Places/Place8/HoundPotential.visible = true
			potentials.append(8)
		if not (9 in others):
			$Places/Place9/HoundPotential.visible = true
			potentials.append(9)
		if not (10 in others):
			$Places/Place10/HoundPotential.visible = true
			potentials.append(10)

	if place == 10:  # 7, 6, 9
		if not (7 in others):
			$Places/Place7/HoundPotential.visible = true
			potentials.append(7)
		if not (6 in others):
			$Places/Place6/HoundPotential.visible = true
			potentials.append(6)
		if not (9 in others):
			$Places/Place9/HoundPotential.visible = true
			potentials.append(9)

	if place == 9:  # 8, 6, 10
		if not (8 in others):
			$Places/Place8/HoundPotential.visible = true
			potentials.append(8)
		if not (6 in others):
			$Places/Place6/HoundPotential.visible = true
			potentials.append(6)
		if not (10 in others):
			$Places/Place10/HoundPotential.visible = true
			potentials.append(10)

	if place == 8:  # 5, 6, 9
		if not (5 in others):
			$Places/Place5/HoundPotential.visible = true
			potentials.append(5)
		if not (6 in others):
			$Places/Place6/HoundPotential.visible = true
			potentials.append(6)
		if not (9 in others):
			$Places/Place9/HoundPotential.visible = true
			potentials.append(9)

	if place == 7:  # 4, 6
		if not (4 in others):
			$Places/Place4/HoundPotential.visible = true
			potentials.append(4)
		if not (6 in others):
			$Places/Place6/HoundPotential.visible = true
			potentials.append(6)

	if place == 6:  # 5, 2, 3, 4, 7
		if not (5 in others):
			$Places/Place5/HoundPotential.visible = true
			potentials.append(5)
		if not (2 in others):
			$Places/Place2/HoundPotential.visible = true
			potentials.append(2)
		if not (3 in others):
			$Places/Place3/HoundPotential.visible = true
			potentials.append(3)
		if not (4 in others):
			$Places/Place4/HoundPotential.visible = true
			potentials.append(4)
		if not (7 in others):
			$Places/Place7/HoundPotential.visible = true
			potentials.append(7)

	if place == 5:  # 2, 6
		if not (2 in others):
			$Places/Place2/HoundPotential.visible = true
			potentials.append(2)
		if not (6 in others):
			$Places/Place6/HoundPotential.visible = true
			potentials.append(6)

	if (place == 4) or (place == 2):  # 1, 3
		if not (1 in others):
			$Places/Place1/HoundPotential.visible = true
			potentials.append(1)
		if not (3 in others):
			$Places/Place3/HoundPotential.visible = true
			potentials.append(3)

	if place == 3:  # 2, 1, 4
		if not (2 in others):
			$Places/Place2/HoundPotential.visible = true
			potentials.append(2)
		if not (1 in others):
			$Places/Place1/HoundPotential.visible = true
			potentials.append(1)
		if not (4 in others):
			$Places/Place4/HoundPotential.visible = true
			potentials.append(4)
	
	if place == 2:  # 1, 3
		if not (1 in others):
			$Places/Place1/HoundPotential.visible = true
			potentials.append(1)
		if not (3 in others):
			$Places/Place3/HoundPotential.visible = true
			potentials.append(1)

	# place == 1 means the hound cant go any further

	print("hound potentials successful, ", potentials)

	return potentials


func hare_potentials_set(value: bool) -> void:
	$Places/Place1/HarePotential.visible = value
	$Places/Place2/HarePotential.visible = value
	$Places/Place3/HarePotential.visible = value
	$Places/Place4/HarePotential.visible = value
	$Places/Place5/HarePotential.visible = value
	$Places/Place6/HarePotential.visible = value
	$Places/Place7/HarePotential.visible = value
	$Places/Place8/HarePotential.visible = value
	$Places/Place9/HarePotential.visible = value
	$Places/Place10/HarePotential.visible = value
	$Places/Place11/HarePotential.visible = value


func hound_potential_set(value: bool) -> void:
	$Places/Place1/HoundPotential.visible = value
	$Places/Place2/HoundPotential.visible = value
	$Places/Place3/HoundPotential.visible = value
	$Places/Place4/HoundPotential.visible = value
	$Places/Place5/HoundPotential.visible = value
	$Places/Place6/HoundPotential.visible = value
	$Places/Place7/HoundPotential.visible = value
	$Places/Place8/HoundPotential.visible = value
	$Places/Place9/HoundPotential.visible = value
	$Places/Place10/HoundPotential.visible = value
	$Places/Place11/HoundPotential.visible = value


func _ready() -> void:
	hound_potential_set(false)
	hound_potential_set(false)
