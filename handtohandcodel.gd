#tool
extends Control


#var keys = { 'left':'qwertyasdfghzxcvb'}
var pressed_keys = {}

#export var value = 0.5 setget set_value, get_value
#func set_value(arg):
#	value = arg
##	update()
#func get_value():
#	return value#*end %step ?

func _ready():
	for i in range(0,255):
		pressed_keys[i] = false
	print(pressed_keys)

#style
export var fg = Color(1,1,1, 0.3)
export var bg = Color(0,0,0, 0.3)


func end():
	print(find_node("a"),find_node("b"),find_node("c"))

func _gui_input(event):
	if event is InputEventKey and not event.is_echo():
		if pressed_keys.has(event.scancode):
#		print(event.scancode," ", pressed_keys.has(event.scancode), "=>", event.pressed, "(",pressed_keys[event.scancode],")")
			pressed_keys[event.scancode] = event.is_pressed()
			update()
			
			if event.pressed:
				if find_node("a").text:
					if find_node("b").text:
						if find_node("c").text:
							end()
						else: find_node("c").text = str(event.scancode)
					else: find_node("b").text = str(event.scancode)
				else: find_node("a").text = str(event.scancode)
		else:
			find_node("a").text = ""
			find_node("b").text = ""
			find_node("c").text = ""
			
func _draw():
	
	var start = 30
	var x = start
	var y = start
	for item in pressed_keys:
		x+=start
		if x+start > rect_size.x:
			y+=start
			x=start 
		if pressed_keys[item]:
			draw_circle( Vector2(x,y), start*0.4, fg )
		else:
			draw_circle( Vector2(x,y), start*0.4, bg )
	
	


