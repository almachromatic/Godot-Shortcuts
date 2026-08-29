class_name Player
extends CharacterBody2D

@export var speed = 150
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@onready var area_2d: Area2D = $Direction/Area2D

var input
var last_direction: Vector2 = Vector2.RIGHT
var playback: AnimationNodeStateMachinePlayback

func _ready() -> void:
	playback = animation_tree["parameters/playback"]

#test
func _physics_process(_delta: float) -> void:
	move_and_slide()
	update_animation_parameters()
	select_animation()
	process_movement()

func process_movement():
	var input = Input.get_vector("Left", "Right", "Up", "Down")
	if input != Vector2.ZERO:
		velocity = input * speed
		last_direction = input
	else:
		velocity = Vector2.ZERO
	

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interact"):
		var actionables = area_2d.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func update_animation_parameters():
	animation_tree["parameters/Idle/blend_position"] = last_direction
	animation_tree["parameters/Walk/blend_position"] = last_direction

func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")
