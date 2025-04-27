extends Area2D

const SPEED := 400
var screen_size
@onready  var anim = $anim

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
