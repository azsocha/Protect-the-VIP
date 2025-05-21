extends Control
@export var ammoDisplay = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ammoDisplay > -1:
		$RichTextLabel2.text = str(ammoDisplay)

func decreaseAmmo():
	ammoDisplay = ammoDisplay - 1
