

extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D #pull from sprite node, you'll likely need to change the name


func _ready() -> void:
	interactable.interact = _on_interact


func _on_interact():
	if sprite_2d.frame == 0:
		sprite_2d.frame = 1
		interactable.is_interactable = false
		print("You closed the curtains")
	
	else:
		sprite_2d.frame = 0
		print("You opened the curtains")
