extends Node2D
@onready var spawn_point: Marker2D = $SpawnPoint
const BASE_BALL_BALL = preload("uid://ekjj7mywbutd")

func _ready() -> void:
	pass
	
func spawn_baseball():
	var baseball = BASE_BALL_BALL.instantiate() # create instance
	baseball.global_position = spawn_point.global_position # place it
	get_tree().current_scene.add_child(baseball) # add to wor
