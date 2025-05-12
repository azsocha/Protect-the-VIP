extends Node2D

signal Level3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Level3.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
