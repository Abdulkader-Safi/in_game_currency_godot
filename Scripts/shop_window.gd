extends Window

var coins: int

func _ready():
	$CoinLabel.text = "$" + str(coins)
	hide()

func _on_close_requested():
	hide()


func _on_increase_coin_button_pressed():
	coins += 100
	$CoinLabel.text = "$" + str(coins)
