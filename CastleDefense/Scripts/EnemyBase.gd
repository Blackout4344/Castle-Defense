extends Node2D

export var spawn_rate : float;

var EnemyScene : PackedScene = preload("res://Scenes/Enemy.tscn");

func _ready():
    $SpawnCooldown.wait_time = spawn_rate;

func _on_SpawnCooldown_timeout():
    add_child(EnemyScene.instance());
    spawn_rate *= 0.9;
    $SpawnCooldown.wait_time = spawn_rate;
