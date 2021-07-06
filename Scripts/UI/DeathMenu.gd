extends Control


func _ready():
	if OS.get_name() == "Android":
		$ColorRect/VBoxContainer/HBoxContainer2/Continue.visible = true
		if self.get_parent().alreadyContinued: $ColorRect/VBoxContainer/HBoxContainer2/Continue.disabled = true
		else: $ColorRect/VBoxContainer/HBoxContainer2/Continue/AdMob.load_rewarded_video()

func _on_Quit_pressed(): #if you quit, then we go to the main menu
	var _change = get_tree().change_scene("res://Scripts/Menues/mainMenu.tscn")
	queue_free()


func _on_Continue_pressed():
	$ColorRect/VBoxContainer/HBoxContainer2/Continue/AdMob.show_rewarded_video()


func _on_AdMob_rewarded(_currency, _ammount):
	self.get_parent().get_node("Lizard").position = self.get_parent().get_node("Spawnpoint").position
	self.get_parent().get_node("Lizard").get_node("Timer").start()
	queue_free()
