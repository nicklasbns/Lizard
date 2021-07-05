extends Node

var leftHanded:bool = false #very important

var coins:int

var curLvl := "Beginner"


#cosmetics

var hat := "none"

var body := "LizardBody"

var color := "387f2e"

func toImg(src:String):
	var textRect := TextureRect.new()
	var img := Image.new()
	var itex := ImageTexture.new()
	img.load(src)
	itex.create_from_image(img)
	return itex
