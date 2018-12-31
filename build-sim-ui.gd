extends Control

var action setget set_action

func set_action(arg):
	action = str(arg)
	$"Statusbar/Label".text = action

func _on_TabContainer_tab_selected(tab):
	  set_action( $"toolbar/HBoxContainer/MarginContainer/TabContainer".get_tab_title(tab) )
