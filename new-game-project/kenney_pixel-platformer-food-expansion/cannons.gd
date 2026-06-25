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
	
