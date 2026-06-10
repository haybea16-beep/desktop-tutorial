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
	if area.is_in_group("slash") and hit == false:
		hit = true
		$wholesprite.visible = false
		$sliceright.visible = true
		$sliceright/half1.gravity = 100.0
		$sliceright/half2.gravity = 100.0
		var fruit_speed = 1000
		$sliceright/half1.velocity = Vector2.UP.rotated($sliceright/half1.global_position) * fruit_speed
		$sliceright/half2.velocity = Vector2.DOWN.rotated($sliceright/half2.global_position) * fruit_speed
		$Timer.start()
		rotation_speed = 0
		$"..".score += 1

func _on_area_2_dmiddle_area_entered(area: Area2D) -> void:
	if area.is_in_group("slash") and hit == false:
		hit = true
		$wholesprite.visible = false
		$slicedowned.visible = true
		$slicedowned/half1.gravity = 100.0
		$slicedowned/half2.gravity = 100.0
		var fruit_speed = 1000
		$slicedowned/half1.velocity = Vector2.LEFT.rotated($slicedowned/half1.global_position) * fruit_speed
		$slicedowned/half2.velocity = Vector2.RIGHT.rotated($slicedowned/half2.global_position) * fruit_speed
		$Timer.start()
		rotation_speed = 0
		$"..".score += 1


func _on_area_2_drights_area_entered(area: Area2D) -> void:
	if area.is_in_group("slash") and hit == false:
		hit = true
		$wholesprite.visible = false
		$slicedrightslash.visible = true
		$slicedrightslash/half1.gravity = 100.0
		$slicedrightslash/half2.gravity = 100.0
		var fruit_speed = 1000
		$slicedrightslash/half1.velocity = Vector2.UP.rotated($slicedrightslash/half1.global_position + deg_to_rad(-45)) * fruit_speed
		$slicedrightslash/half2.velocity = Vector2.DOWN	.rotated($slicedrightslash/half2.global_position + deg_to_rad(-45)) * fruit_speed
		$Timer.start()
		rotation_speed = 0
		$"..".score += 1


func _on_area_2_dlefts_area_entered(area: Area2D) -> void:
	if area.is_in_group("slash") and hit == false:
		hit = true
		$wholesprite.visible = false
		$slicedleftslash.visible = true
		$slicedleftslash/half1.gravity = 100.0
		$slicedleftslash/half2.gravity = 100.0
		var fruit_speed = 1000
		$slicedleftslash/half1.velocity = Vector2.UP.rotated($slicedleftslash/half1.global_position + deg_to_rad(45)) * fruit_speed
		$slicedleftslash/half2.velocity = Vector2.DOWN	.rotated($slicedleftslash/half2.global_position + deg_to_rad(45)) * fruit_speed
		$Timer.start()
		rotation_speed = 0
		$"..".score += 1


func _on_timer_timeout() -> void:
	queue_free()
