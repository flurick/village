extends WindowDialog

signal prop_changed
export var prop = {
#	"test":10,
#	"foo":"bar",
#	"baz":42
}

func _ready():
	window_title = name
	
func set_prop(key, value):
	prop[key] = value
	print("set_prop")
	match key:
		"d": 
			$Diagram.set_value(value)
			print("set_prop d")
		"dmax": $Diagram.set_value_max(value)
	prop_changed()

func prop_changed():
	$internal.lst()
	emit_signal("prop_changed")

#func property_list_changed_notify():
#	print("new prop!")

func _on_WindowDialog_gui_input(event):
	if event is InputEventMouseButton:
		if event.doubleclick:
			$LineEdit.text = name
			$LineEdit.show()
			$LineEdit.grab_focus()
