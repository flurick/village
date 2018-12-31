extends Button

var target

func _ready():
	target = get_node("../WindowDialog").get_instance_id()
	
func _pressed():
	instance_from_id(target).show()