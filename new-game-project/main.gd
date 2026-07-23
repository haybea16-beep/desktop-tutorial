extends Node2D

@onready var mouse_trail_line: Light2D = $Line2D

var max_trail_points = 5
var point_distance_threshold = 2.0
var mouse_still_timer = 0.0
var mouse_still_timeout = 0.2
var last_mouse_pos: Vector2 = Vector2.INF

var game_is_on = false
var score = 0

func _ready():
	mouse_trail_line.clear_points()
	$Labeltime. text = "Time: 60"
	
func _process(delta):
	var current_mouse_pos = get_global_mouse_position()
	
	if game_is_on == true:
		$Labeltime.text = "Time: " + str(roundi($"Timergame length".time_left))
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and game_is_on == true:
		$Area2Dslash/CollisionShape2D.disabled = false
		$Area2Dslash.global_position = get_global_mouse_position()
		
		if last_mouse_pos != Vector2.INF and current_mouse_pos.distance_to(last_mouse_pos) > 0.1:
			mouse_still_timer = 0.0
		else:
			mouse_still_timeout += delta
			
		if mouse_trail_line.get_point_count() == 0 or \
		   mouse_trail_line.get_point_position(mouse_trail_line.get_point_count() - 1).distance_to(current_mouse_pos) > point_distance_threshold:
			mouse_trail_line.add_point(current_mouse_pos)
		
		while mouse_trail_line.get_point_count() > max_trail_points:
			mouse_trail_line.remove_point(0)
		
		if mouse_still_timer >= mouse_still_timeout:
			mouse_trail_line.clear_points()
			mouse_still_timer = 0.0
			last_mouse_pos = Vector2.INF
	else:
		mouse_trail_line.clear_points()
		mouse_trail_line.clear_points()
		last_mouse_pos = Vector2.INF
	$Area2Dslash/CollisionShape2D.disabled = true
	
	last_mouse_pos = current_mouse_pos
