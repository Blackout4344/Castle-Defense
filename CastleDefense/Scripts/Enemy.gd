extends KinematicBody2D

export var health : float;

func _ready():
    $HealthBar.max_value = health;

func _process(delta):
    if (health <= 0):
        queue_free();
    $HealthBar.value = health;
