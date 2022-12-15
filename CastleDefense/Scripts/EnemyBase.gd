extends Node2D

export var spawn_rate : float;
export var health : float;

var EnemyFootmanScene : PackedScene = preload("res://Scenes/EnemyFootman.tscn");

func _ready():
    $SpawnCooldown.wait_time = spawn_rate;
    $HealthBar.max_value = health;
    
func _process(delta):
    if (health <= 0):
        queue_free();
    $HealthBar.value = health;

func _on_SpawnCooldown_timeout():
    var new_enemy : KinematicBody2D = EnemyFootmanScene.instance();
    new_enemy.position = $EnemyLocation.position;
    add_child(new_enemy);
    spawn_rate *= 0.99;
    $SpawnCooldown.wait_time = spawn_rate;
