extends CharacterBody2D

signal died
@onready var explodeSound = $AudioStreamPlayer2D
var haveAmmo = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "default"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		explodeSound.play()
		$AnimatedSprite2D.animation = "blowingUp"
		$AnimatedSprite2D.play()
		call_deferred("restart_level")
		

func restart_level():
	died.emit()

func outOfAmmo() -> void:
	haveAmmo = false
