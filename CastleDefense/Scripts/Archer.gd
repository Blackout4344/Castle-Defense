extends KinematicBody2D

export var health : float;
export var attack_cooldown : float; 
export var attack_range : float;

onready var ArrowScene : PackedScene = preload("res://Scenes/Arrow.tscn");
var target : PhysicsBody2D = null;

func _ready():
    $AttackCooldown.wait_time = attack_cooldown;
    
func _process(delta):
    var enemy_x : int = 10000000;
    for i in $AttackRange.get_overlapping_bodies():
        if (i.filename != "res://Scenes/EnemyPlaceholder.tscn"):
            continue;
        if (i.global_position.x <= enemy_x):
            enemy_x = i.global_position.x;
            target = i;
    
func _on_AttackCooldown_timeout():
    if (target != null):
        var new_arrow : KinematicBody2D = ArrowScene.instance();
        get_parent().add_child(new_arrow);
        new_arrow.global_position = $Sprite/Bow.global_position;
        new_arrow.shoot(target.global_position);
