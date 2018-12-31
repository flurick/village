extends Node2D

#do you need hardware to draw with omre parameters in realtime? sliders moved with velocity modified with +/- keys per parameter
#tablets with rotation and tilt are expenive is there a software solution? emulate input pen with app
#is there a simpler hardware alternative? midi

var is_drawing = false
var color = Color(.5,.5,.5, .5)

var lines = []
var line = []
var cursor = {
	
}

var size = {
	value = 5,
	v = 0
}

class line:
	var points = []
	var tags = []

class point:
	var texture 
	var scale = Vector2(1,1)
	var color = Color(0,0,0, 0.8)
	var rotation = 0
	var velocity = Vector2(0,0)


func _input(event):
	
	if event is InputEventMouseButton:
		if event.pressed:
			is_drawing = true
		else:
			is_drawing = false
			lines.append(line.duplicate())
			line.clear()
	
	if event is InputEventMouseMotion:
		if is_drawing:
			line.append(event.global_position)


func _process(delta):
	
	if Input.is_key_pressed(KEY_D):  size.v += -0.3
	if Input.is_key_pressed(KEY_F):  size.v += 0.3
#	if Input.is_key_pressed(KEY_SPACE): change to other tag for line
		
	
	size.value += size.v
	clamp(size.value, 1, 1000)
	size.v *= 0.9
	
	update()


func _draw():
	
	for l in lines:
		var last_point
		for point in l:
			if last_point:
				draw_line(point, last_point, color, size.value)
			last_point = point

	var last_point
	for point in line:
		if last_point:
			draw_line(point, last_point, color, size.value)
		last_point = point

