extends Node


#GUI SETTINGS

#Screen
const SCREEN_MIN_X = 0
const SCREEN_MAX_X = 1200
const SCREEN_MIN_Y = 0
const SCREEN_MAX_Y = 700



#PLAYER SETTINGS
var active_mech

var transmittable = false
var dropping_off = true

#Physics
var player_accel = 1200
var player_maxspeed = 200
var player_friction = -500
var player_gravity = 4000
var player_jumpspeed = -1600
var player_minjump = -200

#Mech 1
var mech_1_pos = Vector2()
var mech_2_pos = Vector2()
var currentScene = null





#ENEMY SETTINGS

#Zeus 5
#Physics
var zeus_accel = 1200
var zeus_maxspeed = 170
var zeus_friction = -50
var zeus_gravity = 4000
var zeus_jumpspeed = -1800
var zeus_minjump = -200

func _ready():
	   #On load set the current scene to the last scene available
   currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
   #Demonstrate setting a global variable.
   Globals.set("MAX_POWER_LEVEL",9000)


   
# create a function to switch between scenes 
func setScene(scene):
   #clean up the current scene
   currentScene.queue_free()
   #load the file passed in as the param "scene"
   var s = ResourceLoader.load(scene)
   #create an instance of our scene
   currentScene = s.instance()
   # add scene to root
   get_tree().get_root().add_child(currentScene)

	
	
