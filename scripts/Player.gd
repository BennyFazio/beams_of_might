extends Area2D

export var speed = 400

var vel = Vector2()
var screensize
var extents
var opacity
var opacity_switch = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	screensize = get_viewport_rect().size
	extents = get_node("sprite").get_texture().get_size() / 2
	var opacity = 0
	
	set_opacity(1)
func _input(event):
	if event.is_action_pressed("ui_c"): 
		opacity_switch = not opacity_switch
	

	
func _fixed_process(delta):
	var input = Vector2(0, 0)
	input.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	# input.y = Input.is_action_pressed("ui_down") - Input.is_action_pressed("ui_up")
	vel = input.normalized() * speed
	var pos = get_pos() + vel * delta
	pos.x = clamp(pos.x, extents.width, screensize.width - extents.width)
	pos.y = clamp(pos.y, extents.height , screensize.height - extents.height)
	set_pos(pos)
	
	
	
	if opacity_switch == false:
		set_opacity(1)
	else: set_opacity(0)
	
