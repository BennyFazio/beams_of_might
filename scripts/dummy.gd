extends KinematicBody2D

onready var ground_ray = get_node("ground_ray")
onready var sprite = get_node("sprite")
onready var camera = get_node("camera")

var accel = global.player_accel
var max_speed = global.player_maxspeed
var friction = global.player_friction
var gravity = global.player_gravity
var jump_speed = global.player_jumpspeed
var min_jump = global.player_minjump

var acc = Vector2()
var vel = Vector2()
#var anim = "idle"

var active = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)



func _input(event):
	if active == true:
		if event.is_action_pressed("ui_up") and ground_ray.is_colliding():
			vel.y = jump_speed
		if event.is_action_released("ui_up"):
			vel.y = clamp(vel.y, min_jump, vel.y)
		
		
		
func _fixed_process(delta):
	acc.y = gravity
	if active == true:
		acc.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	else:
		acc.x = 0
	acc.x *= accel
	if acc.x == 0:
		acc.x = vel.x * friction * delta
	
	vel += acc * delta
	vel.x = clamp(vel.x, -max_speed, max_speed)
	
	var motion = move(vel * delta)
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)
	if abs(vel.x) < 10:
		vel.x = 0
		
		
	if active == false:
		set_opacity(.2)
		#camera.make_current()
	if active == true:
		set_opacity(1)
		camera.make_current()
		
	# set animation
#	if vel.x == 0:
#		anim = "idle"
#	else:
#		anim = "running"
#	if vel.x > 0:
#		sprite.set_flip_h(false)
#	elif vel.x < 0:
#		sprite.set_flip_h(true)
#	sprite.play(anim)


