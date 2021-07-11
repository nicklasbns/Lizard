extends Node2D

var levels = load("res://Scripts/Levels.tscn").instance()
var level

func _ready(): #we load the level that we want to play, and transfers parrents 
	for kid in levels.get_children(): kid.visible = false #Hiding all the kids away
	level = levels.get_node(Global.curLvl)
	levels.remove_child(level)
	add_child(level)
	level.set_position(self.get_position())
	if OS.get_name() == "Android":
		$dPad.visible = true
		if Global.leftHanded: $dPad.rect_position = Vector2(-800,352)
		else: $dPad.rect_position = Vector2(800,352)
	$AdMob.load_rewarded_video()
	$CenterContainer/VBoxContainer/ProgressBar.max_value = level.progress[1]

func _process(_delta):
	if !level.loaded:
		$CenterContainer/VBoxContainer/ProgressBar.value = level.progress[0]


func _on_AdMob_rewarded(_currency, _ammount):
	self.get_node(level.get_name()).get_node("Lizard").respawn()
	self.get_node(level.get_name()).get_node("DeathMenu").visible = false


func _on_AdMob_rewarded_video_loaded():
	self.get_node(level.get_name()).get_node("DeathMenu").get_node("ColorRect/VBoxContainer/HBoxContainer2/Continue").visible = true

