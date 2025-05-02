extends Node2D

@export var bug_scene : PackedScene
var score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$BugTimer.stop()
	$ScoreTimer.stop()

func new_game():
	$StartTimer.start()
	$player.start_pos($StartPosition.position) 
	score = 0



func _on_start_timer_timeout() -> void:
	$BugTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout() -> void:
	score += 1

#func _on_bug_timer_timeout() -> void:
	#var bug = bug_scene.instantiate()
	#var bug_location = $BugPath/BugPathLocation
	#bug_location.progress_ratio = randf()
#
	#var direction = bug_location.rotation + PI / 2
	#bug.position = bug_location.position
	#direction += randf_range(-PI /4, PI /4)
	#bug.rotation = direction
	#
	#var velocity =Vector2(randf_range(150.0,250.0), 0.0)
	#bug.linear_velocity = velocity.rotated(direction)
	#add_child(bug)
	
func _on_bug_timer_timeout() -> void:
	var bug = bug_scene.instantiate()
	var bug_location = $BugPath/BugPathLocation
	
	# Defina a área "meio" que queremos evitar
	var middle_min = 0.4
	var middle_max = 0.6
	
	# Gere um valor de progress_ratio que evite o meio
	var progress_ratio
	if randf() < 0.5:
		progress_ratio = randf_range(0.0, middle_min)
	else:
		progress_ratio = randf_range(middle_max, 1.0)
	
	bug_location.progress_ratio = progress_ratio
	
	var direction = bug_location.rotation + PI / 2
	bug.position = bug_location.position
	direction += randf_range(-PI /4, PI /4)
	bug.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)
