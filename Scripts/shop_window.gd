extends Window

@export var buy_style: StyleBoxFlat = preload("res://Assets/Resources/buy_button_box_flat.tres")
@export var bought_style: StyleBoxFlat = preload("res://Assets/Resources/bought_button_box_flat.tres")
@export var selected_style: StyleBoxFlat = preload("res://Assets/Resources/selected_button_box_flat.tres")

var buy_buttons: Array[Node]

func _ready():
	Global.load_data()
	$CoinLabel.text = Global.get_coins_as_text()
	hide()

	connect_signals()
	update_button()

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
		else:
			$NotEnoughCoins.show()

	elif button.text == "Bought":
		Global.data['selected_player_index'] = button_index
		get_parent().get_node("Player").update_player_sprite()

	update_button()
	Global.save_data()

func update_button() -> void:
	set_bought_button()
	set_selected_player_button()

func set_bought_button():
	for i in range(Global.data['items'].size()):
		if Global.data['items'].values()[i]:
			buy_buttons[i].text = "Bought"
			# buy_buttons[i].disabled = true

func set_selected_player_button():
	buy_buttons[Global.data['selected_player_index']].text = "Selected"

func _on_increase_coin_button_pressed():
	Global.data["coins"] += 100
	$CoinLabel.text = Global.get_coins_as_text()
	Global.save_data()

func _on_close_requested():
	hide()
