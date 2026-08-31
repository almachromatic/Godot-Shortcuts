extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var button: Button = $CanvasLayer/Button


func _input(event):
	if Input.is_action_just_pressed("Pause"):
		canvas_layer.show()
		get_tree().paused = true

#Connect through button node 
func _on_button_button_down() -> void:
	get_tree().paused = false
	canvas_layer.hide()
