extends Area2D

@export var Location: String = ""
var entered = false

func _on_body_entered(body: Player) -> void:
	entered = true

func _on_body_exited(body: Player) -> void:
	entered = false

func _process(delta:):
	if entered == true:
		if Input.is_action_just_pressed("Interact"):
			get_tree().change_scene_to_file(Location)
