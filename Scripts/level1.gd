extends Node2D

var nextLevel = "res://Scenes/level2.tscn"

func _on_door_level_exit():
	get_tree().change_scene_to_file(nextLevel)
