extends KinematicBody2D

export var health : float;
export var attack_range : float;

onready var ArrowScene : PackedScene = preload("res://Scenes/Arrow.tscn");
var target : PhysicsBody2D = null;
    
func _physics_process(delta):
    target = null;
    var enemy_x : int = 10000000;
    for i in $AttackRange.get_overlapping_bodies():
        if (i.filename != "res://Scenes/Enemy.tscn"):
            continue;
        if (i.global_position.x <= enemy_x):
            enemy_x = i.global_position.x;
            target = i;

func _on_AttackCooldown_timeout():
    if (target != null):
        look_at(target.global_position);
        var new_arrow : KinematicBody2D = ArrowScene.instance();
        get_parent().add_child(new_arrow);
        new_arrow.global_position = $Sprite/Bow.global_position;
        new_arrow.shoot(target.global_position);
