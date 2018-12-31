extends TextEdit

func _on_TextEdit_text_changed():
	
	for line in text.split("\n"):
		var words = line.split(" ")
		if words.size() == 2:
			get_parent().set_prop(words[0], words[1])
			$"../internal".lst()
