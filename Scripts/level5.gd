extends Node2D

var nextLevel = "res://Scenes/level1.tscn"
var thisLevel = "res://Scenes/level5.tscn"

func _on_door_level_exit():
	get_tree().change_scene_to_file(nextLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file(thisLevel)