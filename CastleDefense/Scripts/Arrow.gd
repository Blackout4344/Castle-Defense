extends KinematicBody2D

export var damage : float;
export var speed : float;

var vel : Vector2;

func _physics_process(delta):
	vel = move_and_slide(vel, Vector2.UP);

func shoot(target : Vector2):
	look_at(target);
	vel = global_position.direction_to(target);
	vel = vel.normalized() * speed;
	
func _on_BodyCollisions_body_entered(body : PhysicsBody2D):
	if (body.filename == "res://Scenes/EnemyFootman.tscn"):
		body.health -= damage;
		queue_free();
	if body.filename == "res://Scenes/EnemyBase.tscn":
		body.hit()
		queue_free()
