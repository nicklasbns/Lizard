extends Area2D

func _ready():
	$Sprite.texture = Global.toImg("res://Assets/Bodies/" + Global.body + ".png")
