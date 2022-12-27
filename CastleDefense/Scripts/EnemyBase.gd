extends Node2D

export var spawn_rate : float;
export var health : float;


onready var healthbar = $HealthBar
onready var health_tween = $Tween
var EnemyFootmanScene : PackedScene = preload("res://Scenes/EnemyFootman.tscn");

func _ready():
    $SpawnCooldown.wait_time = spawn_rate;
    $HealthBar.max_value = health;
    
func _process(delta):
    if health <= 0:
        queue_free()
    $HealthBar.value = health;

func _on_SpawnCooldown_timeout():
    var new_enemy : KinematicBody2D = EnemyFootmanScene.instance();
    new_enemy.position = $EnemyLocation.position;
    add_child(new_enemy);
    spawn_rate *= 0.99;
    $SpawnCooldown.wait_time = spawn_rate;


func hit(damage : int):
    var original_color = Color("#ff0000")
    var highlights_color = Color("ff8787")
    var bar_style = healthbar.get("custom_styles/fg")
    
    
    
    health_tween.interpolate_property(healthbar,"value",healthbar.value,health,0.4,Tween.TRANS_LINEAR,Tween.EASE_IN)
    health_tween.interpolate_property(bar_style,"bg_color",original_color,highlights_color,0.2,Tween.TRANS_LINEAR,Tween.EASE_IN)
    health_tween.interpolate_property(bar_style,"bg_color",highlights_color,original_color,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
    health_tween.start()
