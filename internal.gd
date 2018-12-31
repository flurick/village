extends TextEdit

var default_prop = []


func _ready():
	lst()


func dict2str(dict):
	var string = ""
	for key in dict:
		string += key
		string += " : "
		string += str(dict[key])
		string += "\n"
	return string


func filter(dict, filter):
	var filtered_dict = {}
	for key in dict:
		if key.matchn( "*"+filter+"*" ) \
		or str(dict[key]).matchn( "*"+filter+"*" ):
			filtered_dict[key] = dict[key]
	return filtered_dict


func lst():
	
	var prop = get_parent().prop
	text = dict2str(filter(prop, $Filter.text))

func _on_Filter_text_changed(new_text):
	lst()

