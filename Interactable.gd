extends Area2D

@export var interact_name: String = ""
@export var is_interactable: bool = true

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var interact: Callable = func():
	pass

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start) #_example_dialogue_balloon can be replaced by actual dialogue baloon
