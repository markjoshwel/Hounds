extends Node2D


signal new_turn
signal end_turn


var potentials: Array[int] = []
var turn: bool = false:  # true = hare, false = hounds
	get:
		return turn
	set(value):
		turn = value
		$UI/Turns.turns += 1
		$Board/HareIndicator.visible = turn
		$Board/HoundsIndicator.visible = not turn
		$HoundSelect.visible = not turn

enum Entity {HARE, HOUND1, HOUND2, HOUND3}
var focus: Entity = Entity.HOUND2
var hare_position: int = 1
var hound1_position: int = 8
var hound2_position: int = 11
var hound3_position: int = 10
var last_hound: Entity = Entity.HOUND2


func _ready() -> void:
	$UI/Turns.turns = 1
	emit_signal("new_turn")


func _on_turns_no_more_turns() -> void:
	$UI/ResultScreen.show_screen("It's a tie!")


#func _notification(what: int) -> void:
#	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
#		$UI/PauseMenu.is_paused = true


func quit() -> void:
	queue_free()
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_board_hit(place: int) -> void:
	print("hit! ", place)
	if not (place in potentials):
		print("  not in potentials, returning")
		return

	var target_pos: Vector2 = Vector2.ZERO
	var target_place: int = 1

	match focus:
		Entity.HARE:
			target_pos = $Hare.position
		
		Entity.HOUND1:
			target_pos = $Hound1.position

		Entity.HOUND2:
			target_pos = $Hound2.position

		Entity.HOUND3:
			target_pos = $Hound3.position
	
	print("  entity at ", target_pos)


	match place:
		1:
			target_pos = $Board/Places/Place1.position
			target_place = 1
		2:
			target_pos = $Board/Places/Place2.position
			target_place = 2
		3:
			target_pos = $Board/Places/Place3.position
			target_place = 3
		4:
			target_pos = $Board/Places/Place4.position
			target_place = 4
		5:
			target_pos = $Board/Places/Place5.position
			target_place = 5
		6:
			target_pos = $Board/Places/Place6.position
			target_place = 6
		7:
			target_pos = $Board/Places/Place7.position
			target_place = 7
		8:
			target_pos = $Board/Places/Place8.position
			target_place = 8
		9:
			target_pos = $Board/Places/Place9.position
			target_place = 9
		10:
			target_pos = $Board/Places/Place10.position
			target_place = 10
		11:
			target_pos = $Board/Places/Place11.position
			target_place = 11

	print("  targeting ", target_place, " at ", target_pos)
	
	match focus:
		Entity.HARE:
			$Hare.position = target_pos
			hare_position = target_place
	
		Entity.HOUND1:
			$Hound1.position = target_pos
			hound1_position = target_place

		Entity.HOUND2:
			$Hound2.position = target_pos
			hound2_position = target_place

		Entity.HOUND3:
			$Hound3.position = target_pos
			hound3_position = target_place

	print("  ending turn")
	emit_signal("end_turn")


func turn_start() -> void:
	print("new turn, focus=", focus, " potentials=", potentials)
	focus_on(focus)

func focus_on(ent: Entity) -> void:
	print("focus_on")
	$Board.hare_potentials_set(false)
	$Board.hound_potential_set(false)
	print("  potential light reset")

	potentials = []
	focus = ent
	print("  set ent=", ent)

	match ent:
		Entity.HARE:
			potentials = $Board.hare_potential(
				hare_position,
				hound1_position,
				hound2_position,
				hound3_position
			)
			print("  hare potentials = ", potentials)

		Entity.HOUND1:
			potentials = $Board.hound_potential(
				hound1_position,
				hound2_position,
				hound3_position,
				hare_position,
			)
			$HoundSelect.position = $Hound1.position
			print("  hound1 potentials = ", potentials)

		Entity.HOUND2:
			potentials = $Board.hound_potential(
				hound2_position,
				hound3_position,
				hound1_position,
				hare_position,
			)
			$HoundSelect.position = $Hound2.position
			print("  hound2 potentials = ", potentials)

		Entity.HOUND3:
			potentials = $Board.hound_potential(
				hound3_position,
				hound1_position,
				hound2_position,
				hare_position,
			)
			$HoundSelect.position = $Hound3.position
			print("  hound3 potentials = ", potentials)


func change_hound_focus(hound: int) -> void:
	print("change_hound_focus called")
	if turn: return  # hare is focused right now

	print("focusing on hound ", hound)

	match hound:
		1:
			focus_on(Entity.HOUND1)
		2:
			focus_on(Entity.HOUND2)
		3:
			focus_on(Entity.HOUND3)


func place_to_column(p: int) -> int:
	if p == 1:
		return 1
	elif p in [2, 3, 4]:
		return 2
	elif p in [5, 6, 7]:
		return 3
	elif p in [8, 9, 10]:
		return 4
	else:
		return 5

func hare_escaped() -> bool:
	# hare escaped requirements
	# 1. end of board
	# 2. all hound places are below hares place
	# 3. no one hound is at least a column further than the hare
	if hare_position == 11:
		return true

	var escaped1: bool = false
	var escaped2: bool = false
	var escaped3: bool = false

	if hound1_position > hare_position:
		escaped1 = true

	if hound2_position > hare_position:
		escaped2 = true

	if hound3_position > hare_position:
		escaped3 = true

	if place_to_column(hound1_position) > hare_position:
		escaped1 = false

	if place_to_column(hound2_position) > hare_position:
		escaped2 = false

	if place_to_column(hound3_position) > hare_position:
		escaped3 = false

	if escaped1:
		if escaped2:
			if escaped3:
				return true

	return false


func hare_immobile() -> bool:
	# probe board for potential spots, and if all spots are occupied by hounds,
	# the hare is immobile.
	var trapped: bool = true

	var hare_potentials: Array[int] = $Board.hare_potential(
		hare_position,
		hound1_position,
		hound2_position,
		hound3_position
	)
	$Board.hare_potentials_set(false)
	$Board.hound_potential_set(false)
	
	for place in hare_potentials:
		if not (place in [hound1_position, hound2_position, hound3_position]):
			trapped = false

	return trapped


func turn_end() -> void:
	print("ending turn")
	if hare_immobile():
		$UI/ResultScreen.show_screen("Hounds win!")

	if hare_escaped():
		$UI/ResultScreen.show_screen("Hare wins!")

	turn = not turn

	potentials = []
	$Board.hare_potentials_set(false)
	$Board.hound_potential_set(false)

	if turn:  # now hare
		last_hound = focus
		focus = Entity.HARE
	else:  # now hounds
		focus = last_hound

	emit_signal("new_turn")
