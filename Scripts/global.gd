extends Node


var settings= {
	"leftHanded":true
}

var currencies := {
	"coins":0,
	}

var curLvl := "Beginner"

#stats

var fruits = {
	"waterMelon": {
		"nutrition": 1,
		"value": 1,
		"image": "res://Assets/Fruits/Watermelon.png"
	},
	"carrot": {
		"nutrition": 1,
		"value": 2,
		"image": "res://Assets/Fruits/Carrot.png"
	},
}

#inventory

var cosmetics = { #equiped rn
	"accessory":"none",
	"body":"LizardBody",
	"color": "387f2e",
	"face": "NeutralFace"
}

var ownedCosmetics = {
	"accessory":{
		"none":true,
	},
	"body":{
		"LizardBody":true,
	},
	"color": {
		"387f2e":true,
	},
	"face": {
		"NeutralFace":true
	}
}

var ownedLevels = {}

var upgrades = {}

var levelMapData = {}

var saveFile = "user://Lizzard.save"

func _saveGame():
	var saveData = {
		"currencies": currencies,
		"cosmetics": cosmetics,
		"ownedCosmetics": ownedCosmetics,
		"ownedLevels": ownedLevels,
		"levelMapData": levelMapData,
		"settings": settings,
		"upgrades": upgrades,
	}
	var file = File.new()
	file.open(saveFile, File.WRITE)
	file.store_var(saveData)
	file.close()

func _loadGame():
	var saveData
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		saveData = file.get_var()
		file.close()
		
		for key in saveData.keys():
			self[key] = saveData[key]
