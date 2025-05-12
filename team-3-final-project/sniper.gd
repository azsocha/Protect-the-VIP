extends Sprite2D

var haveAmmo = true

func _input(event):
	if event is InputEventMouseButton and event.pressed and haveAmmo:
		var tex = texture
		if tex == null:
			return
		
		var sprite_size = tex.get_size() * scale
		var top_left = global_position - sprite_size / 2.0
		var mouse_pos = get_global_mouse_position()
		var sprite_rect = Rect2(top_left, sprite_size)
		
		if sprite_rect.has_point(mouse_pos):
			queue_free()

func outOfAmmo():
	haveAmmo = false
