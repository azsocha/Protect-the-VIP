extends Control

@onready var winSound = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect.hide()
	$restartGame.hide()
	$RichTextLabel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_restart_game_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	get_tree().change_scene_to_file("res://title.tscn")


func _on_area_2d_died() -> void:
	winSound.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$ColorRect.show()
	$restartGame.show()
	$RichTextLabel.show()


func _on_label_died() -> void:
	queue_free()
