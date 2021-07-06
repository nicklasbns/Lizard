extends Area2D

func _ready():
	$Sprite.texture = load("res://Assets/Bodies/" + Global.cosmetics["body"] + ".png")
