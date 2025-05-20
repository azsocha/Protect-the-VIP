extends Area2D

signal died

@onready var badgun = $EnemySound

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		badgun.play()
		call_deferred("restart_level")
		
func restart_level():
	died.emit()
