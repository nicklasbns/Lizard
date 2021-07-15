extends Control

func _ready():
	for cosmeticType in Global.ownedCosmetics.keys():
		for cosmetic in Global.ownedCosmetics[cosmeticType].keys():
			for but in $TabContainer.get_node(cosmeticType).get_node("VBoxContainer/HBoxContainer").get_children():
				if cosmetic == but.get_name(): but.unlocked = true
			for but in $TabContainer.get_node(cosmeticType).get_node("VBoxContainer/HBoxContainer2").get_children():
				if cosmetic == but.get_name():but.unlocked = true
