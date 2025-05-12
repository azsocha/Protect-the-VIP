# Called every frame. 'delta' is the elapsed time since the previous frame.
extends CharacterBody2D

signal died

var haveAmmo = true

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var push_force = 50.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# player animations
	if velocity.length() > 0 and is_on_floor():
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if Input.is_action_just_pressed("move_right"):
		$AnimatedSprite2D.animation = "right"
	elif Input.is_action_just_pressed("move_left"):
		$AnimatedSprite2D.animation = "left"

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _input(event):
	if event is InputEventMouseButton and event.pressed and haveAmmo:
		var tex = $Sprite2D.texture
		if tex == null:
			return
		
		var sprite_size = tex.get_size() * scale
		var top_left = global_position - sprite_size / 2.0
		var mouse_pos = get_global_mouse_position()
		var sprite_rect = Rect2(top_left, sprite_size)
		
		if sprite_rect.has_point(mouse_pos):
			died.emit()
			queue_free()

func restart_level():
	get_tree().reload_current_scene()


func _on_area_2d_died() -> void:
	queue_free()

func outOfAmmo():
	haveAmmo = false
