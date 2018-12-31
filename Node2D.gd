extends Node2D


var r = 30
var last = Vector2(0,0)
var of = (OS.get_ticks_msec()*0.1)
var p = Vector2(0,0)


func _process(delta):
	
	r = 8
	of = OS.get_ticks_msec()
#	OS.delay_msec(60)
	update()


func _draw():
	
	for i in range(2, 9):
		p = Vector2( i*r, sin(i+of*0.02)*r + sin(i)*r )
		if i>2:
			draw_line( p, last, Color(0,0,0) )
		last = p

	draw_line( Vector2(0, 9), Vector2(2*r, sin(of*0.02-r)*-r), Color(0,0,0) )

