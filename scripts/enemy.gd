extends RigidBody2D
@onready var anim: AnimatedSprite2D = $anim

func _ready():
	var enemy_types = anim.sprite_frames.get_animation_names()
	anim.play(enemy_types[randi() % enemy_types.size()])
	

func _process(delta: float):
	pass


func _on_visible_screen_exited() -> void:
	queue_free()
