extends Window

var coins: int

func _ready():
	$CoinLabel.text = "$" + str(coins)
	hide()

func _on_close_requested():
	hide()


func _on_increase_coin_button_pressed():
	Global.data["coins"] += 100
	$CoinLabel.text = Global.get_coins_as_text()
