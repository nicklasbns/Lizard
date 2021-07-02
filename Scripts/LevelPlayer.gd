extends Node2D



func _ready():
	var levels = load("res://Scripts/Levels.tscn").instance()
	var level = levels.get_node(Global.curLvl)
	levels.remove_child(level)
	add_child(level)
