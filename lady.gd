extends Polygon2D


func _process(delta):
	move_local_x(0.3)
	look_at(get_global_mouse_position())


