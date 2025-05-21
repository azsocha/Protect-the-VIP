extends Label
var count = 0
signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	count = count + 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if count == 1:
		text = "I apologize for my late arrival."
	elif count == 2:
		text = "I may have arrived faster if my sniper had been more quick-witted."
	elif count == 3:
		text = "However, I am here now!"
	elif count == 4:
		text = "As you all know, today is a very important day."
	elif count == 5:
		text = "Once this speech is done, I will officially become president!"
	elif count == 6:
		text = "I have a lengthy list of laws to enact post-haste!"
	elif count == 7:
		text = "First, I’ll be working to ban ice cream."
	elif count == 8:
		text = "Then, jailing anyone with a puppy."
	elif count == 9:
		text = "Oh, and working to replace more streets with those floating platforms!"
	elif count == 10:
		text = "And so much more to better everyone"
	elif count == 11:
		text = "Nothing can stop me now!"
	elif count == 12:
		text = "So, to reiterate..."
	elif count == 13:
		text = "..."
		died.emit()
		


func _on_player_died() -> void:
	count = 15
	text = ""
