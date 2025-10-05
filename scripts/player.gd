extends Node2D
@onready var hitbox: CollisionShape2D = $StaticBody2D/Hitbox
@onready var state_chart: StateChart = $StateChart
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var base_ball_guy_sprite: AnimatedSprite2D = %BaseBallGuySprite

func _ready() -> void:
	base_ball_guy_sprite.frame_changed.connect(on_frame_changed)
#	static_body_2d.body_entered.connect(_on_ball_hit)

func start_hitting():
	state_chart.send_event("hit")

func on_frame_changed():
	var current_frame = base_ball_guy_sprite.frame
	# Example: Only enable hitbox on frames 2–4
	if current_frame in [2, 3, 4]:
		hitbox.disabled = false
	else:
		hitbox.disabled = true


func _on_hitting_state_entered() -> void:
	base_ball_guy_sprite.play()

func _on_ball_hit(body):
	print(body.name)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hit"):
		start_hitting()


func _on_idle_state_entered() -> void:
	base_ball_guy_sprite.frame = 0


func _on_hitting_state_physics_processing(delta: float) -> void:
	if not base_ball_guy_sprite.is_playing():
		state_chart.send_event("idle")
