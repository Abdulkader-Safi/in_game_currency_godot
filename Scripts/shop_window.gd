extends Window

var buy_buttons: Array[Node]

func _ready():
	Global.load_data()
	$CoinLabel.text = Global.get_coins_as_text()
	hide()

	connect_signals()

func connect_signals():
	buy_buttons = get_tree().get_nodes_in_group("BuyButton")
	for child in buy_buttons:
		if child is Button:
			child.connect("pressed", _on_button_pressed.bind(child, buy_buttons.find(child)))

func _on_button_pressed(button: Button, button_index: int):
	if button.text.contains("$"):
		var item_price: int = int(button.text.replace("$", ""))

		if Global.data['coins'] >= item_price:
			Global.data['items'][Global.data['items'].keys()[button_index]] = true
			Global.data['coins'] -= item_price
			Global.data['selected_player_index'] = button_index
			$CoinLabel.text = Global.get_coins_as_text()
			Global.save_data()
		else:
			$NotEnoughCoins.show()

func _on_increase_coin_button_pressed():
	Global.data["coins"] += 100
	$CoinLabel.text = Global.get_coins_as_text()
	Global.save_data()

func _on_close_requested():
	hide()
