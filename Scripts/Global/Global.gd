extends Node

var path: String = "user://save.txt"

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

func save_data() -> void:
  var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
  var game_data: Dictionary = {
    'data': data
  }
  file.store_var(game_data)
  file.close()

func load_data() -> void:
  var file: FileAccess = FileAccess.open(path, FileAccess.READ)
  if !FileAccess.file_exists(path):
    return

  var game_data: Dictionary = file.get_var()
  data = game_data['data']
  file.close()

func get_coins_as_text() -> String:
  return "$" + str(data['coins'])