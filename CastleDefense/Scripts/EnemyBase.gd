extends Node2D

export var spawn_rate : float;
export var health : float;


var EnemyScene : PackedScene = preload("res://Scenes/Enemy.tscn");

func _ready():
    $SpawnCooldown.wait_time = spawn_rate;
    $HealthBar.max_value = health;
    
func _process(delta):
    if (health <= 0):
        queue_free();
    $HealthBar.value = health;

func _on_SpawnCooldown_timeout():
    var new_enemy : KinematicBody2D = EnemyScene.instance();
    new_enemy.position = $EnemyLocation.position;
    add_child(new_enemy);
    spawn_rate *= 0.9;
    $SpawnCooldown.wait_time = spawn_rate;
