extends Polygon2D


var v = Vector2(0,0)
var a = 0
var wheelsize = 0.1
var lagom = 0.62
var speed = 1

func _process(delta):
		
	if Input.is_key_pressed(KEY_W):
		v.x += speed
	if Input.is_key_pressed(KEY_S):
		v.x -= speed
	v *= lagom
	
	
	if Input.is_key_pressed(KEY_A):
		a += wheelsize
	if Input.is_key_pressed(KEY_D):
		a -= wheelsize
	a = clamp(a, -5,5)
	update()
	
	if abs(v.x)<0.5: v.x = 0
	if v.x>0:
		move_local_x(v.x)
		rotate(deg2rad(-a))
	if v.x<0:
		move_local_x(v.x)
		rotate(deg2rad(a))
		

func _draw():
	for i in range(1,100):
		draw_circle(Vector2(speed*i,0).rotated(deg2rad(a*-i)), 3, ColorN("yellow"))
		
	for i in range(1,100):
		draw_circle(Vector2(speed*-i,0).rotated(deg2rad(a*i)), 3, ColorN("red"))
		
		
		
		