extends KinematicBody2D

signal update

export var SPEED = 25000
var direction = Vector2()


func _ready():
	pass

func _process(delta):
	emit_signal("update")

func _physics_process(delta):
	if direction.length() >0:
		direction = direction.normalized() * SPEED
		move_and_slide(direction * delta)
