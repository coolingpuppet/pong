extends Node2D

signal goal_left
signal goal_right


func _on_LeftWall_body_entered(body):
	emit_signal("goal_left")



func _on_RightWall_body_entered(body):
	emit_signal("goal_right")

