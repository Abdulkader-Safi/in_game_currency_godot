extends Node

var data: Dictionary = {
  'items': {
    'pink' = false,
    'red' = false,
    'violet' = true,
    'yellow' = false,
  },
  'select_player_index': 2,
  "coins": 0
}

func get_coins_as_text():
  return "$" + str(data['coins'])