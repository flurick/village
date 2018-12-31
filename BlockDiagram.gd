tool
extends Control

export (String, "Pie", "Block", "Line") var type = "pie" setget set_type
func set_type(arg):
	type = float(arg)
	update()

export var value_max = 24 setget set_value_max
func set_value_max(arg):
	value_max = float(arg)
	update()

export var value = 4 setget set_value
func set_value(arg):
	value = float(arg)
	update()


#style
export var size = 8 #block size
export var space = 3 #block spacing
export var fg = Color(.9,.1,.6) #forground
export var bg = Color(.1,.9,.6) #background
var M  = Vector2(0,0) #middle of control


func _input(event):
	if event is InputEventMouseMotion:
		value = event.position.x * 0.1
		update()


func _draw():
	M = rect_size*0.5
	value = clamp(value, 0, value_max)
	draw_rect( Rect2(0,0, rect_size.x,rect_size.y), bg, false)
	match type:
		"Pie": draw_pie_diagram()
		"Block": draw_block_diagram()
		"Line": draw_line_diagram()


func draw_block_diagram():
	
	var p = Vector2(space,space*3)
	for i in range(0,max(value, value_max)):
		
		#wrap layout
		if p.x+size > M.x*2:
			p.y += size+space
			p.x = space
		
		#draw filled or empty block
		if i>=int(value):
			draw_line( p, p+Vector2(size,0), bg, size)	
		else:
			draw_line( p, p+Vector2(size,0), fg, size)
		p.x += size+space


func draw_pie_diagram():
	var r = min(rect_size.x, rect_size.y)
	
	draw_circle(M, r*0.5, bg)
	
	if value == 0:  return
#	if value_max==0 or value==0 or rect_size.x==0 or rect_size.y==0: return
	for angle in range(0, 360*(value/value_max)):
		draw_line( M, M+Vector2.UP.rotated(deg2rad(angle))*r*0.5, fg, 2)


func draw_line_diagram():
	var sample_size = 1
	var w = rect_size.x / sample_size
	var h = rect_size.y
#	var max_sample = value # max_of(samples)
	if value_max==0 or value==0 or rect_size.x==0 or rect_size.y==0: return
	draw_line(Vector2(w*0.5,h), Vector2(w*0.5, h-h*(value/value_max)), fg, w)
