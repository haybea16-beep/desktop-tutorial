extends CharacterBody2D

var direction_hit: String
var gravity = 300.0
var hit = false
var rotation_speed = 120.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func _process(delta):
	rotation_degrees += rotation_speed * delta
	

func _on_area_2_dside_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_2_dmiddle_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_2_drights_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_2_dlefts_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
