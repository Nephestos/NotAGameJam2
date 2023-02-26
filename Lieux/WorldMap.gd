extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_gift = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Gift_got_gift(gift_name):
	current_gift = gift_name
	print("Got gift: ", gift_name)
