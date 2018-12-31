extends Spatial

var up = Vector3(0,1,0)

var input_pos = Vector3(0,0,0)
var input_pos_friction = 0.8
var pos_max_speed = 0.1

var camera_rotation_speed = 5

func _process(delta):
	
	input_pos *= input_pos_friction
	
	input_pos.x += action_axis("camera_right", "camera_left")
	input_pos.z += action_axis("camera_backward", "camera_forward")
	translate(pos_max_speed*input_pos)

	rotate( up, deg2rad(action_axis("camera_rotate_left","camera_rotate_right"))*camera_rotation_speed )
	

func action_axis(action_a, action_b):
	return Input.get_action_strength(action_a)-Input.get_action_strength(action_b)
	