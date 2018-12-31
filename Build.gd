extends Tabs

func _ready():
	for menu_build in get_tree().get_nodes_in_group("menu_build"):
		for building in menu_build.get_children():
			var new = $"HBoxContainer/Template".duplicate()
			new.show()
			$HBoxContainer.add_child(new)
			new.get_node("VBoxContainer/Label").text = building.name
			new.action = str("build ", building.name)
	
	get_node("HBoxContainer/Template").hide()