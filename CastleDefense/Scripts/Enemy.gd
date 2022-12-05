extends KinematicBody2D

export var health : float;
export var damage : float;
export var speed : float;

onready var vel : Vector2 = Vector2(-speed, 0);
var target : PhysicsBody2D = null;

func _ready():
    $HealthBar.max_value = health;

func _physics_process(delta):
    if (health <= 0):
        Global.money += 2;
        queue_free();
    $HealthBar.value = health;
    move_and_slide(vel, Vector2.UP);
    var player_x : int = -10000000;
    for i in $BodyCollisions.get_overlapping_bodies():
        if (i.filename != "res://Scenes/Footman.tscn"):
            continue;
        if (i.global_position.x >= player_x):
            player_x = i.global_position.x;
            target = i;
            
func _on_AttackCooldown_timeout():
    if (weakref(target).get_ref()):
        target.health -= damage;
