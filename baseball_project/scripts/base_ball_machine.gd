extends Node2D
@onready var spawn_point: Marker2D = $SpawnPoint
const BASE_BALL_BALL = preload("uid://ekjj7mywbutd")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed_mod: float

func _ready() -> void:
	speed_mod = randf_range(0.5, 2.0)
	animation_player.speed_scale = speed_mod
	
func spawn_baseball():
	var baseball:BaseBall = BASE_BALL_BALL.instantiate()
	baseball.speed = baseball.speed * speed_mod
	baseball.global_position = spawn_point.global_position # place it
	get_tree().current_scene.add_child(baseball)
	speed_mod = randf_range(0.5, 2.0)
	animation_player.speed_scale = speed_mod
