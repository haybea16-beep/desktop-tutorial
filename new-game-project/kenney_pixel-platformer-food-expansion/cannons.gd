extends Node2D

var burger = preload("res://food-pack-3/burger.tscn")
var stake = preload("res://food-pack-3/stake.tscn")
var ribs = preload("res://food-pack-3/ribs.tscn")
var drumb_stick = preload("res://food-pack-3/drum_stick.tscn")
var big_drumb_stick = preload("res://food-pack-3/big_drum_stick.tscn")
var deviled_eggs = preload("res://food-pack-3/deviled eggs.tscn")


func _on_timer_timeout() -> void:
	if $"..".game_is_on == false:
		return
	var ran = randi_range(1,7)
	var delived_eggs_chance = randi_range(1,10)
	var food_instance
	
	if delived_eggs_chance <= 2:
		food_instance = deviled_eggs.instantiate()
	else:
		var food = randi_range(1,5)
		if food == 1:
			food_instance = burger.instantiate()
		elif food == 2:
			food_instance = stake.instantiate()
		elif food == 3:
			food_instance = ribs.instantiate()
		elif food == 4:
			food_instance = drumb_stick.instantiate()
		elif food == 5:
			food_instance = big_drumb_stick.instantiate()
	
	add_sibling(food_instance)
	var food_speed = 600
	if ran == 1:
		food_instance.global_position = $cannon1.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position + deg_to_rad(20)) * food_speed
	elif ran == 2:
		food_instance.global_position = $cannon2.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position) * food_speed
	elif ran == 3:
		food_instance.global_position = $cannon3.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position) * food_speed
	elif ran == 4:
		food_instance.global_position = $cannon4.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position) * food_speed
	elif ran == 5:
		food_instance.global_position = $cannon5.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position + deg_to_rad(-20)) * food_speed
	elif ran == 6:
		food_instance.global_position = $cannon6.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position + deg_to_rad(-80)) * food_speed
	elif ran == 7:
		food_instance.global_position = $cannon7.global_position
		food_instance.velocity = Vector2.UP.rotated(food_instance.global_position + deg_to_rad(80)) * food_speed
	
	
	
	
	
	
	
	
	
