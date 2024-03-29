extends KinematicBody2D

export var health : float;
export var damage : float;
export var speed : float;

onready var vel : Vector2 = Vector2(speed, 0);
var target : PhysicsBody2D = null;

func _ready():
	$HealthBar.max_value = health;

func _physics_process(delta):
	if (health <= 0):
		queue_free();
	$HealthBar.value = health;
	move_and_slide(vel, Vector2.UP);
	var enemy_x : int = 10000000;
	for i in $BodyCollisions.get_overlapping_bodies():
		if (i.filename != "res://Scenes/EnemyFootman.tscn" && i.filename != "res://Scenes/EnemyBase.tscn"):
			vel = Vector2(speed, 0);
			continue;
		if (i.global_position.x <= enemy_x):
			enemy_x = i.global_position.x;
			target = i;
		vel = Vector2(0, 0);
			
func _on_AttackCooldown_timeout():
	if (weakref(target).get_ref()):
		target.health -= damage;
func _on_AnimatedSprite_animation_finished():
	if (weakref(target).get_ref()):
		if ($BodyCollisions.overlaps_body(target)):
			$AnimatedSprite.play("attack");
	else:
		$AnimatedSprite.play("run");
