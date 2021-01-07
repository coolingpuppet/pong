extends KinematicBody2D

var SPEED = 400
var Velocity = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_pressed("player_up"):
		Velocity.y = -SPEED
	elif Input.is_action_pressed("player_down"):
		Velocity.y = SPEED
	else:
		Velocity.y = 0
		
	move_and_slide(Velocity)
