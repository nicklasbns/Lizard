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
	if $Fruits.get_child_count() < fruitAmount: #If we don't have enough food, then we 
		var food:Area2D = load("res://Scripts/Fruit.tscn").instance() #add more
		food.set_position(randPos())
		
		while len(food.get_overlapping_areas()) > 0: #don't work, but should prevent
			food.set_position(randPos())   #food from spawning in player, but frame 
		$Fruits.add_child(food)   #detection is after two frames have passed so WIP
		
		
func randPos(): #returns a random vector2 in a grid based on the size of the map
	return Vector2(
			(randi() % (size[0]-2) -(size[0]-3)/2) *64,
			(randi() % (size[1]-2) -(size[1]-3)/2) *64
			)
