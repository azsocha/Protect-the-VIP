extends Sprite2D

@export var ammo = 9999999
signal outOfAmmo

@onready var shoot_sound = $ShootSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		if ammo > 0:
			shoot_sound.play()
		
		texture = load("res://characterImages/crosshair2.png")
		await get_tree().create_timer(0.3).timeout
		texture = load("res://characterImages/crosshair.png")
		ammo = ammo - 1
		print(ammo)
		if ammo < 1:
			outOfAmmo.emit()

func lastLevelAmmo():
		ammo = 2

func cutsceneAmmo():
		ammo = 1
