extends CharacterBody2D

signal died
@onready var explodeSound = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "default"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		explodeSound.play()
		$AnimatedSprite2D.animation = "blowingUp"
		$AnimatedSprite2D.play()
		call_deferred("restart_level")
		

func restart_level():
	died.emit()
