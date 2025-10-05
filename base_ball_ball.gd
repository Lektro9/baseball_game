extends CharacterBody2D

@export var speed: float = 1000.0
var direction: Vector2 = Vector2.RIGHT  # starting direction
@export var acceleration: float = 4
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		# Reflect the direction using the collision normal
		direction = direction.bounce(collision.get_normal())
		speed *= acceleration
		rotation = direction.angle()
		animation_player.speed_scale = 2.0
