extends CharacterBody2D

var direction_hit: String
var gravity = 300.0

func _ready():
	$wholesprite/AnimationPlayer.play("RESET")
	
func 
