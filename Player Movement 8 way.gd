class_name Player 
extends CharacterBody2D
@export var speed = 200
var last_direction: Vector2 = Vector2.RIGHT
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Direction/Area2D


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interact"):
		var actionables = area_2d.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _physics_process(_delta: float) -> void:
	process_movement()
	process_animation()
	move_and_slide()

func process_movement():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	if input_direction != Vector2.ZERO:
		velocity = input_direction * speed
		last_direction = input_direction
	else:
		velocity = Vector2.ZERO

func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation("Walk", last_direction)
	else:
		play_animation("Idle", last_direction)

func play_animation(prefix: String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + "_right")
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + "_left")
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + "_forward")
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + "_back")
