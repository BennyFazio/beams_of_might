extends KinematicBody2D

onready var timer = get_node("timer")

var vel = Vector2(0, -100)
var pos = Vector2()

func _ready():
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	pos = get_pos() + vel * delta
	set_pos(pos)
	if timer.get_time_left() == 0:
		change_dir()
	
func change_dir():
	timer.start()
	vel *= -1