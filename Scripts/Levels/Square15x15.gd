extends Node2D

var size:Array = [15,15]

export var fruitAmount:int = 1

func _ready():
	randomize() #It aint fun if its the same every time
	
	
func _process(delta):
	if $Fruits.get_child_count() < fruitAmount:
		var food:Area2D = load("res://Scripts/Fruit.tscn").instance()
		food.set_position(Vector2(
			(randi() % (size[0]-2) -(size[0]-3)/2) *64,
			(randi() % (size[1]-2) -(size[1]-3)/2) *64
			))
		while len(food.get_overlapping_areas()) > 0:
			food.set_position(Vector2(
			(randi() % (size[0]-3) -(size[0]-3)/2) *64,
			(randi() % (size[1]-3) -(size[1]-3)/2) *64
			))
		$Fruits.add_child(food)
