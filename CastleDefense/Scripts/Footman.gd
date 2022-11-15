extends KinematicBody2D

export var health : float;
export var damage : float;
export var speed : float;

onready var vel : Vector2 = Vector2(speed, 0);

func _process(delta):
	move_and_slide(vel, Vector2.UP);
