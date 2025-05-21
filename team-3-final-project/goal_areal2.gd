extends Area2D






func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		await get_tree().create_timer(1.7).timeout
		get_tree().change_scene_to_file("res://FinalLevel.tscn")
