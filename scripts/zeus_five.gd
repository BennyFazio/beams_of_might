extends KinematicBody2D



onready var sprite = get_node("sprite")
onready var burner1 = get_node("sprite/burner1")
onready var burner2 = get_node("sprite/burner2")


var accel = global.zeus_accel
var max_speed = global.zeus_maxspeed
var friction = global.zeus_friction
var gravity = global.zeus_gravity
var jump_speed = global.zeus_jumpspeed
var min_jump = global.zeus_minjump




var pos = Vector2()
var rot = 0
var speed
var vel = Vector2(0, 0)
var acc = Vector2(0, 0)
var DETECT_RADIUS = 1200
var target = Vector2()
var target_dist = Vector2()
var mech1_location = Vector2()
var mech2_location = Vector2()
var mech1_proximity = Vector2()
var mech2_proximity = Vector2()
var anim = "idle"
var actual_target = Vector2()
var dmg = 0

func init(spawn_pos):
	pos = spawn_pos

func _ready():
	add_to_group("enemy")
	randomize()
	speed = 200
	set_fixed_process(true)
	#set_pos(pos)
	
func _fixed_process(delta):
	#print(acc)
#	for mech in get_tree().get_nodes_in_group("mechs"):
#		var mech_proximity = (mech.pos - pos).length()
#		print(mech_proximity)
	mech1_location = global.mech_1_pos
	mech2_location = global.mech_2_pos
	mech1_proximity = (mech1_location - pos).length()
	mech2_proximity = (mech2_location - pos).length()
	
	#for now do this w/o incorporating Detection Radius. Just focus on getting enemy to select
	#between both mechs based on proximity. later this feature will only be relevant if both mechs
	#are in proximity
	if mech1_proximity <= mech2_proximity:
		target = mech1_location
		target_dist = target - pos
	elif mech1_proximity > mech2_proximity:
		target = mech2_location
		target_dist = target - pos
		
	if target.x > pos.x:
		actual_target = target - Vector2(60, 0)
	elif target.x < pos.x:
		actual_target = target + Vector2(60, 0)
		
	pos = get_global_pos()		
	acc.y = gravity
	acc += target_dist.normalized()
	#print(target)
	
#	if acc.x == 0:
#		acc.x = vel.x * friction * delta
	vel += acc * delta
	vel.x = clamp(vel.x, -max_speed, max_speed)
	var motion = move(vel * delta)
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)
#	if abs(vel.x) < 10:
#		vel.x = 0
	if actual_target.x >= pos.x:
		if vel.x <= 0:
			acc *= -1
			vel *= -.2
	elif actual_target.x < pos.x:
		if vel.x > 0:
			acc *= -1 
			vel *= -.2
	
	
	#if vel.x == 0:
	#	anim = "idle"
	
	sprite.play(anim)
	if vel.x < 0:
		sprite.set_flip_h(false)
		burner1.show()
		burner2.hide()
	elif vel.x >= 0:
		sprite.set_flip_h(true)
		burner1.hide()
		burner2.show()
	if abs(target_dist.y) < 30:
		if abs(target_dist.x) < 80:
			if sprite.is_flipped_h():
				anim = "attacking"
			elif sprite.is_flipped_h() == false:
				anim = "attacking"
	else:
		anim = "attacking"
	sprite.play(anim)
	
			
func damage():
	if dmg <= 1:
		dmg = dmg +1
	else:
		queue_free()
	
#	pos = get_pos() + vel * delta
#	set_pos(pos)
	