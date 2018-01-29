extends TextureFrame

func _ready():
   set_process(true)
   set_process_input(true)
	
   
func _process(delta):

	pass

func _on_Start_pressed():	
	print("hi")
	#replace "res://game.scn" with the directory for game and the root to global
	get_node("/root/global").setScene("res://scenes/demoLevel.tscn")


func _on_Quit_pressed():
	print("hi")
	get_tree().quit()
	


func _on_Options_pressed():
	print("hi")
	get_node("/root/global").setScene("res://scenes/Options.tscn")
	
