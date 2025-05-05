extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		texture = load("res://characterImages/crosshair2.png")
		await get_tree().create_timer(0.3).timeout
		texture = load("res://characterImages/crosshair.png")
