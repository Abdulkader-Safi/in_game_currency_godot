extends Control


func _on_shop_button_pressed():
	get_parent().get_node("ShopWindow").visible = !get_parent().get_node("ShopWindow").visible
