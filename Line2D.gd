extends Line2D

var r = 16


func _ready():
	for i in range(0,10):
		add_point( Vector2(i*r, sin(i)*r) )


func _process(delta):
	points[points.size()-1].y = get_global_mouse_position().y
	for i in range(0,10):
		if i>0:
			points[i].y = points[i-1].y

