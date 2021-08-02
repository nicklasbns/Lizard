extends CheckButton

export var price:int

export(String, "coins") var currency = "coins"

export var unlocked:bool

func _ready():
	if self.get_name() in Global.upgrades:
		unlocked = Global.upgrades[self.get_name()].unlocked
		self.pressed = Global.upgrades[self.get_name()].enabled
	if !unlocked:
		self.text += "     price: " + str(price)

func _on_CheckButton_toggled(button_pressed):
	if !unlocked: #if we don't have
		if price > Global.currencies[currency]: #if we can't afford
			self.pressed = false #then toggle it off
		else: # if we can pay
			Global.currencies[currency] -= price
			self.unlocked = true
			self.text = self.text.trim_suffix("     price: " + str(price))
	if unlocked: # if we own it or bought it
		Global.upgrades[self.get_name()] = {
			"unlocked": true,
			"enabled": button_pressed
		}
		Global._saveGame()
