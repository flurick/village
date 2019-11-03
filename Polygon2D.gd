#tool
extends Polygon2D

#export var value = 0.5 setget set_value, get_value
#func set_value(arg):
#	value = arg
##	update()
#func get_value():
#	return value#*end %step ?


#style
#export var fg = Color(.3,.3,.3)
#export var bg = Color(.6,.6,.6)
#var M  = Vector2(0,0)


#func _input(event):
#	if event is InputEventMouseMotion:
#		look_at(m

var speed = 50
var v = Vector2.ZERO

func _process(delta):

	#local
#	if Input.is_key_pressed(KEY_W):
#		move_local_x( speed*delta )
#	if Input.is_key_pressed(KEY_S):
#		move_local_x( -speed*delta )
#	if Input.is_key_pressed(KEY_A):
#		move_local_y( speed*delta )
#	if Input.is_key_pressed(KEY_D):
#		move_local_y( -speed*delta )

	#global
	if Input.is_key_pressed(KEY_SPACE):
		move_local_x( speed*delta*10 )
	v += Vector2( key2axis(KEY_A,KEY_D),key2axis(KEY_W,KEY_S) ) * speed * delta
	position += v
	v *= 0.8
#	if Input.is_key_pressed(KEY_W):
#		move_local_x( speed*delta )
#	if Input.is_key_pressed(KEY_S):
#		move_local_x( -speed*delta )
#	if Input.is_key_pressed(KEY_A):
#		move_local_y( speed*delta )
#	if Input.is_key_pressed(KEY_D):
#		move_local_y( -speed*delta )

	look_at( get_global_mouse_position() )
#	update()

func key2axis(a,b):
	if Input.is_key_pressed(a) and Input.is_key_pressed(b): return 0
	if Input.is_key_pressed(a): return -1
	if Input.is_key_pressed(b): return 1
	return 0

#func _draw():
#
#	var M = rect_size*0.5
#	var r = min(M.x,M.y) #radius
#
#	draw_circle( M,r, bg )
#

