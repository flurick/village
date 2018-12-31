#tool
extends LineEdit

var e = Expression.new()
var word = []

func _on_LineEdit2_text_changed(new_text):
	
	var words = ""
	
	word = new_text.split(" ")
	if word.size() > 0:
		
		for i in range(0,word.size()):
			if get_parent().prop.has(word[i]):
				words += get_parent().prop.get(word[i]) + " "
			else:
				words += word[i] + " "
		
		var parsed = e.parse(words)
		if parsed == 0:
			$"../Label".text = str(e.execute())
		else:
			$"../Label".text = str("err ", parsed)

