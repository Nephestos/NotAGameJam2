extends Area2D

var entered = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered== true:
		 get_tree().change_scene("res://TopviewMap.tscn")


func _on_Area2D_body_entered(body: PhysicsBody2D):
	entered = true
