class_name Level

extends Node2D

export var size:Array = [15,15]

export var fruitAmount:int = 1

export var unlocked:bool = true

export var price:int = 0

func _ready():
	randomize() #It aint fun, if its always the same
	self.scale 
	if self.visible: #only start it, if its the level we are playing
		#Adding the game elements
		self.add_child(load("res://Scripts/Player/Lizard.tscn").instance())
		var fruit = Node2D.new()
		fruit.set_name("Fruits")
		self.add_child(fruit)
	
func _process(delta):
	if $Fruits.get_child_count() < fruitAmount:
		var food:Area2D = load("res://Scripts/Fruit.tscn").instance()
		food.set_position(randPos())
		while len(food.get_overlapping_areas()) > 0:
			food.set_position(randPos())
		$Fruits.add_child(food)
		
		
func randPos():
	return Vector2(
			(randi() % (size[0]-2) -(size[0]-3)/2) *64,
			(randi() % (size[1]-2) -(size[1]-3)/2) *64
			)
