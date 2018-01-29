extends KinematicBody2D



const speed = 200
var gravity = false
var vel = Vector2()
var pos = Vector2()


var picking_up

var mouse_pos = Vector2()

var immovable = false


func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	if immovable == false:
		if event.is_action_pressed("ui_q"):
			vel = Vector2(-150, 0)
		if event.is_action_pressed("ui_e"):
			vel = Vector2(150, 0)
		if event.is_action_released("ui_q"):
			vel = Vector2(0, 0)
		if event.is_action_released("ui_e"):
			vel = Vector2(0, 0)
#	if global.dropping_off == true:
#		if (event.type==InputEvent.MOUSE_MOTION):
#			mouse_pos = event.get_pos()
	
	
	#if event.is_action_pressed("ui_r"): 
		#gravity = not gravity
		
func _fixed_process(delta):
	var direction = Vector2(0,0)
	if global.dropping_off == true:
		pass
		
		
	#pos.x = get_local_mouse_pos().x
	pos.y = -1774.87
	pos += vel * delta
	set_pos(pos)
		
	#set_pos(pos)
		
	
	
	
