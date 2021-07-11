extends Node

var leftHanded:bool = false #very important


var currencies := {
	"coins":0,
	}

var curLvl := "Beginner"

#stats

var fruits = {
	"waterMelon": {
		"dropChance": 50,
		"nutrition": 1,
		"value": 1,
		"image": "res://Assets/Fruits/Watermelon.png"
	},
	"carrot": {
		"dropChance": 40,
		"nutrition": 1,
		"value": 2,
		"image": "res://Assets/Fruits/Carrot.png"
	},
}

#inventory

var cosmetics = { #equiped rn
	"hat":"none",
	"body":"LizardBody",
	"color": "387f2e",
	"face": "NeutralFace"
}

var ownedCosmetics = {
	"hat":{
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

#save data

var levelMapData = {

}
