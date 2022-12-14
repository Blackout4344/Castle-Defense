extends KinematicBody2D

export var attack_range : float;

onready var ArrowScene : PackedScene = preload("res://Scenes/Arrow.tscn");
var target : PhysicsBody2D = null;
    
func _physics_process(delta):
    var enemy_x : int = 10000000;
    for i in $AttackRange.get_overlapping_bodies():
        if (i.filename != "res://Scenes/Enemy.tscn"):
            continue;
        if (i.global_position.x <= enemy_x):
            enemy_x = i.global_position.x;
            target = i;

func _on_AttackCooldown_timeout():
    if (weakref(target).get_ref()):
        $Sprite.play("shoot");
        look_at(target.global_position);
        var new_arrow : KinematicBody2D = ArrowScene.instance();
        get_parent().add_child(new_arrow);
        new_arrow.global_position = $ArrowLocation.global_position;
        new_arrow.shoot(target.global_position);
        
func _on_Sprite_animation_finished():
    $Sprite.stop();
