extends  Area2D

onready var sound = get_node("sampler")
var vel = Vector2()
var mech_pos = Vector2()
export var speed = 1000

func _ready():
	set_fixed_process(true)

func start_at(dir, pos):
	set_rot(-dir + PI)
	set_pos(pos)
	vel = Vector2(2000, 0).rotated(dir + PI/2)
	vel.y *= -1 # + v
	sound.play("laser")
	
	
func _fixed_process(delta):
	mech_pos = global.mech_1_pos
	set_pos(get_pos() + vel * delta)
	if get_pos().x > mech_pos.x + 1000 or get_pos().x < mech_pos.x - 1000 or get_pos().y > mech_pos.y + 1000 or get_pos().y < mech_pos.y - 1000:
		queue_free()

func _on_ammo_mech1_body_enter( body ):
	if body.get_groups().has("enemy"):
		body.damage()
		queue_free()