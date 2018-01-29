extends KinematicBody2D

onready var mech_1 = get_node("/scripts/mech_1")
onready var mech_2 = get_node("mech_2")
onready var sprite = get_node("sprite")
var speed 
var accel = 0
var Zeus_1_pos = self.get_pos()
var side
var side2

#onready var Mech1pos = global.mech_1_pos
#onready var Mech2pos = global.mech_2_pos

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var Mech1pos = global.mech_1_pos
	var Mech2pos = global.mech_2_pos
	var Zeus_1_pos = self.get_pos()
	var speed1 = Vector2(100,0)
	randomize()
	print(global.active_mech)
	if Mech1pos.x - self.get_pos().x > 0:
		 side = -1
	else:
			side = 1
	if Mech2pos.x - self.get_pos().x > 0:
		 side2 = -1
	else:
			side2 = 1
			
 if global.active_mech == 1:
		
		if Mech1pos.x - self.get_pos().x > 150:
			set_pos(Vector2(get_pos().x + speed1.x * delta, Mech1pos.y))
#	    move(speed1)
#	    self.set_pos(Mech1pos - Vector2(-155,0))
		else:
#			print("hi")
			set_pos(Vector2(get_pos().x, Mech1pos.y))
#	    move(Vector2(-1,0))
#	    self.set_pos(Mech1pos + Vector2(-155,0))
	
		if 100 > abs(Mech1pos.x - self.get_pos().x):
	    set_pos(Vector2(get_pos().x + side * speed1.x * delta, Mech1pos.y))
#	    print(get_pos())
#	    move(Vector2(-100 * delta,0))
#	    self.set_pos(Mech1pos - Vector2(155,0))
		else:
			print("hi")
			set_pos(Vector2(get_pos().x, Mech1pos.y))
#	    move(Vector2(-1,0))
#	    self.set_pos(Mech1pos + Vector2(-155,0))
#
		if self.get_pos().x - Mech1pos.x > 150:
	 	set_pos(Vector2(get_pos().x - speed1.x * delta, Mech1pos.y))
#		 print(get_pos())
#	    move(Vector2(speed2,0))
#	    self.set_pos(Mech1pos - Vector2(-155,0))
		else:
#			pass
			set_pos(Vector2(get_pos().x, Mech1pos.y))
#			
#		if 200 > self.get_pos().x - Mech1pos.x > .05:
#			set_pos(Vector2(get_pos().x - speed1.x * delta, Mech1pos.y))
#		else:
#			pass
#	    	set_pos(Vector2(get_pos().x, Mech1pos.y))
 else:
  pass
#	

  if global.active_mech == 2:
  		if Mech2pos.x - self.get_pos().x > 150:
  			set_pos(Vector2(get_pos().x + speed1.x * delta, Mech2pos.y))
#	    move(speed1)
#	    self.set_pos(Mech1pos - Vector2(-155,0))
  		else:
  			set_pos(Vector2(get_pos().x, Mech2pos.y))
#	    move(Vector2(-1,0))
#	    self.set_pos(Mech1pos + Vector2(-155,0))
	
  		if 100 > abs(Mech2pos.x - self.get_pos().x):
  			set_pos(Vector2(get_pos().x + side2 * speed1.x * delta, Mech2pos.y))
#	    print(get_pos())
#	    move(Vector2(-100 * delta,0))
#	    self.set_pos(Mech1pos - Vector2(155,0))
  		else:
  			print("hi")
  			set_pos(Vector2(get_pos().x, Mech2pos.y))
#	    move(Vector2(-1,s0))
#	    self.set_pos(Mech1pos + Vector2(-155,0))
#
  		if self.get_pos().x - Mech2pos.x > 150:
  			set_pos(Vector2(get_pos().x - speed1.x * delta, Mech2pos.y))
#		 print(get_pos())
#	    move(Vector2(speed2,0))
#	    self.set_pos(Mech1pos - Vector2(-155,0))
  		else:
  			set_pos(Vector2(get_pos().x, Mech2pos.y))
			
  else:
  			pass