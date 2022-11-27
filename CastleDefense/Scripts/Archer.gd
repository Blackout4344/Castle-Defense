extends KinematicBody2D

export var health : float;
export var attack_cooldown : float; 
export var speed : float;
export var attack_range : float;

onready var ArrowScene : PackedScene = preload("res://Scenes/Arrow.tscn");
onready var vel : Vector2 = Vector2(speed, 0);
var target : PhysicsBody2D = null;

func _process(delta):
	move_and_slide(vel, Vector2.UP);
	
func _on_AttackRange_body_entered(body : PhysicsBody2D):
	if (body.filename == "res://Scenes/EnemyPlaceholder.tscn"):
		target = body;

func _on_AttackCooldown_timeout():
	if (target != null):
		add_child(ArrowScene.instance());
