extends KinematicBody2D

signal update

export var move_speed = 400

var direction = Vector2()

func _ready():
	pass
	
func _process(delta):
	emit_signal("update")

func _physics_process(delta):
	if direction.length() > 0:
		direction = direction.normalized() * move_speed
		move_and_collide(direction*delta)
		
