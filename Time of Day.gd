extends Timer

#func _process(delta):
#	update()




func _on_Time_of_Day_timeout():
	get_parent().environment.background_sky.sun_latitude += 10
