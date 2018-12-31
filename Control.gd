#tool
extends Control

#behaviour
var value = 0.5 setget set_value, get_value
var start = 0
#var step = 0.1
var end = 1
var speed = 0.1 setget set_speed

#style
export var fg = Color(.3,.3,.3)
export var fg2 = Color(.3,.3,.3, .5)
export var bg = Color(.6,.6,.6)
var M  = Vector2(0,0)

func get_minimum_size():
    return Vector2(30, 30)

func set_speed(arg):
	speed = arg
	set_process(arg)
	
func set_value(arg):
	value = arg
	$Label.text = str(value)
	update()
func get_value():
	return value#*end %step ?


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if speed != 0: speed = 0
			else: set_speed(0.1)


func _process(delta):
	value += speed
	update()


func _draw():
	
	var M = rect_size*0.5
	var r = min(M.x,M.y) #radius
	
	#dial
	draw_circle( M,r, bg )
	
	#icon
	draw_circle( M, 6, fg2 )
	draw_circle( M, 4, bg )
	draw_line( M, M-Vector2(0,7), fg2, 2)
	
	#value line/dot
	var v = Vector2(r,0).rotated(value)
	draw_line( M+v*0.5, M+v, fg, r*0.3)


