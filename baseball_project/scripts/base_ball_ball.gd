extends RigidBody2D
class_name BaseBall

@export var speed: float = 1500.0
@export var direction: Vector2 = Vector2.RIGHT

func _ready():
	gravity_scale = 0.0        # no falling
	linear_damp = 0.0          # no slow-down

	# Give initial velocity
	linear_velocity = direction.normalized() * speed

func _integrate_forces(state):
	# Keep speed constant even after bouncing
	linear_velocity = linear_velocity.normalized() * speed
