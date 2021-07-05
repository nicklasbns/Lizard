extends Node2D

func _ready(): #we load the level that we want to play, and transfers parrents 
	var levels = load("res://Scripts/Levels.tscn").instance()
	var level = levels.get_node(Global.curLvl)
	levels.remove_child(level)
	add_child(level)
	if OS.get_name() == "Android":
		$dPad.visible = true
		if Global.leftHanded: $dPad.rect_position = Vector2(-800,352)
		else: $dPad.rect_position = Vector2(800,352)
