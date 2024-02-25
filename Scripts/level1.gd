extends Node2D

var nextLevel = "res://Scenes/level2.tscn"
var thisLevel = "res://Scenes/level1.tscn"

func _on_door_level_exit():
	get_tree().change_scene_to_file(nextLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file(thisLevel)
	if Input.is_action_just_pressed("close_game"):
		get_tree().quit()
