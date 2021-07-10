extends Node2D

var levels = load("res://Scripts/Levels.tscn").instance()
var level

func _ready(): #we load the level that we want to play, and transfers parrents 
	level = levels.get_node(Global.curLvl)
	levels.remove_child(level)
	add_child(level)
	if OS.get_name() == "Android":
		$dPad.visible = true
		if Global.leftHanded: $dPad.rect_position = Vector2(-800,352)
		else: $dPad.rect_position = Vector2(800,352)
	$AdMob.load_rewarded_video()



func _on_AdMob_rewarded(currency, ammount):
	self.get_node(level.get_name()).get_node("DeathMenu").visible = false
