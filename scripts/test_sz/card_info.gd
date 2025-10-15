extends Node

class_name CardInfo
var file_path: String = "res://asserts/test_sz/card_info.csv"
var card_info_dict: Dictionary


func _ready():
	card_info_dict = read_csv_to_dict(file_path)
	print(card_info_dict)



func read_csv_to_dict(file_path: String) -> Dictionary:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		print("Error: Could not open file ", file_path)
		return {}
	
	var result = {}
	var headers = []
	var file_line = true
	while not file.eof_reached():
		var line = file.get_csv_line()
		if file_line:
			file_line = false
			headers = line
		elif line.size() > 2:
			var key = line[0]
			var row_dict = {}
			for i in range(0, headers.size()):
				row_dict[headers[i]] = line[i]
			result[key] = row_dict
		else:
			break
	file.close()
	return result
