extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level
var snake
var main
var fruits = []
var map = []
var mapPos = []
var time = 0

func _ready():
	print(len(get_parent().get_parent().get_child(0).get_child(0).get_children()))
	snake = get_parent().get_parent().get_child(0).get_child(0)
	mapPos = get_parent().get_parent().get_parent().mapPos
	get_parent().get_parent().get_parent().get_child(6).modulate = Color(1, 1, 1, 0.3)
	get_parent().get_parent().get_child(1).connect("timeout", self, "readyDraw");

	for pos in mapPos:
		map.push_back([pos, -1, -1, -1, -1])
	for i in len(map):
		for j in len(map):
			if map[i][0].y == map[j][0].y:
				if map[i][0].x-64 == map[j][0].x:
					map[i][1] = j
				if map[i][0].x+64 == map[j][0].x:
					map[i][2] = j
			if map[i][0].x == map[j][0].x:
				if map[i][0].y-64 == map[j][0].y:
					map[i][3] = j
				if map[i][0].y+64 == map[j][0].y:
					map[i][4] = j
	#Input.action_press("Left")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time += _delta
	pass

func readyDraw():
	if time > 2 and time < 3:
		time = 3
		Input.action_press("Left")
		print(1)
	if time > 4:
		time = 0
		Input.action_release("Left")
		print(2)
	self.update()

func _draw():
	self.draw_rect(Rect2(0, 0, 400, 400), Color(255), false)
	self.draw_line(Vector2(20, 20), 
				   Vector2(200, 20), Color(255, 0, 0))
	for i in map:
		self.draw_circle(i[0], 20, Color(0, 0, 255))
		for j in 4:
			if i[j+1] != -1:
				self.draw_line(i[0], map[i[j+1]][0], Color(0, 255, 0))
	for part in snake.get_children():
		self.draw_circle(part.position, 10, Color(255, 0, 0))
	pass
