extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect.hide()
	$retryLevel.hide()
	$restartGame.hide()
	$RichTextLabel.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_level_pressed() -> void:
	get_tree().reload_current_scene()

func _on_restart_game_pressed() -> void:
	pass 


func _on_area_2d_died() -> void:
	$ColorRect.show()
	$retryLevel.show()
	$restartGame.show()
	$RichTextLabel.show()
