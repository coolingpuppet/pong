extends Control

signal new_round
signal exit


func _on_NewButton_pressed():
	emit_signal("new_round")


func _on_MenuButton_pressed():
	emit_signal("exit")
