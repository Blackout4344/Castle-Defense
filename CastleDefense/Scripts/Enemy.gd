extends KinematicBody2D

export var health : float;
export var speed : float;

onready var vel : Vector2 = Vector2(-speed, 0);

func _ready():
    $HealthBar.max_value = health;

func _process(delta):
    if (health <= 0):
        queue_free();
    $HealthBar.value = health;
    move_and_slide(vel, Vector2.UP);
