extends Node2D

var levels = load("res://Scripts/Levels.tscn").instance()
var level

func _ready(): #we load the level that we want to play, and transfers parrents 
	for kid in levels.get_children(): kid.visible = false #Hiding all the kids away
	level = levels.get_node(Global.curLvl)
	levels.remove_child(level)
	level.set_name(Global.curLvl)
	add_child(level)
	level.set_position(self.get_position())
	if OS.get_name() == "Android":
		$dPad.visible = true
		if Global.settings.leftHanded: $dPad.rect_position = Vector2(-800,352)
		else: $dPad.rect_position = Vector2(800,352)
	$CenterContainer/VBoxContainer/ProgressBar.max_value = level.progress[1]
	$AdMob.load_rewarded_video()
	$Banner.load_banner()

func _process(_delta):
	if !level.loaded:
		$CenterContainer/VBoxContainer/ProgressBar.value = level.progress[0]

func _on_AdMob_rewarded(_currency, _ammount):
	self.get_node(level.get_name()).get_node("Lizard").coinAgain()
	$Banner.hide_banner()
	var _change = get_tree().change_scene("res://Scripts/Menues/mainMenu.tscn")

func _on_AdMob_rewarded_video_loaded():
	self.get_node(level.get_name()).get_node("deathMenu").get_node("ColorRect/VBoxContainer/HBoxContainer2/adButton").visible = true



func _on_Banner_banner_loaded():
	$Banner.show_banner()
