extends Node2D

onready var mech_1 = get_node("player_deployment/mech_1")
onready var mech_2 = get_node("player_deployment/mech_2")

func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	if global.transmittable == true:
		if event.is_action_pressed("transmit"):
			mech_1.active = not mech_1.active
			mech_2.active = not mech_2.active
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
func _fixed_process(delta):
	pass

	
func transmit():
	pass