extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	print("WTF 2")
	
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	
func onButtonPressed():
	get_tree().quit()
