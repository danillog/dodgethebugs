extends Area2D

signal hit
const SPEED := 400
@onready var screen_size = get_viewport_rect().size
@onready  var anim = $anim
@onready var collision = $CollisionShape2D

func _ready():
	hide()

func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y < 0:
		anim.play("move_up")
	elif velocity.y > 0:
		anim.play("move_down")
	else:
		anim.play("idle")
	
# ternar if in godot 
	anim.flip_h = true if velocity.x < 0 else false
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	

#verify  player collision
func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)

func start_pos(pos):
	position = pos
	show()
	collision.disabled = false
