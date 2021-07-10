extends Control



func _on_Quit_pressed(): #if you quit, then we go to the main menu
	var _change = get_tree().change_scene("res://Scripts/Menues/mainMenu.tscn")
	queue_free()


func _on_Continue_pressed():
	self.get_parent().get_parent().get_node("AdMob").show_rewarded_video()
