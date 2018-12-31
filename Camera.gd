extends Camera

var ray_length = 1000
var hit 

func group(name, limit=1):
	if limit==1:
		return get_tree().get_nodes_in_group(name)[0]
	else:
		return get_tree().get_nodes_in_group(name)

func _physics_process(delta):
	
	var m = $ViewportContainer.get_global_mouse_position()
	var from = project_ray_origin(m)
	var to = from + project_ray_normal(m) * ray_length
	var space_state = get_world().get_direct_space_state()
	hit = space_state.intersect_ray(from, to)
	
#	if hit:
#		$"../../fly".transform.origin = hit.position

#func get_selected_model(name):
#	return get_node( str("../../Buildings/",name) )
		

var blueprint = Spatial.new()
func _unhandled_input(event):
	
#	if event is InputEventKey \
	if event is InputEventMouseMotion:
		if not hit: return
		if not $"ViewportContainer/ui".action: return
		var action = $"ViewportContainer/ui".action.split(" ")
		if action.size() != 2: return
		
		match action[0]:
			"build":
				blueprint = group("menu_build").get_node(action[1])
				blueprint.transform.origin = hit.position.snapped( Vector3(.3,.3,.3) )
		
	if event is InputEventMouseButton:
		
		if event.button_index == BUTTON_LEFT and event.pressed:
			
			if not $"ViewportContainer/ui".action: return
			var action = $"ViewportContainer/ui".action.split(" ")
			if action.size() != 2: return
			match action[0]:
				"build":
					var placed_blueprint = blueprint.duplicate()
					$"../../floor".add_child(placed_blueprint)
		
		if event.button_index == BUTTON_WHEEL_DOWN:
			if not event.control:
#					translate( Vector3(0,0,-1) ) #zoom
				transform.origin.y += 1 #altitude
			else:
				rotate_x(deg2rad(-10))
				
		if event.button_index == BUTTON_WHEEL_UP:
			if not event.control:
#					translate( Vector3(0,0,1) )
				if transform.origin.y > 1:
					transform.origin.y -= 1
			else:
				rotate_x(deg2rad(10))


