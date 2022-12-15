extends StaticBody2D

export var trap_hold : int;

func _process(delta):
    if (trap_hold <= 0):
        queue_free();

func _on_Trap_body_entered(body : PhysicsBody2D):
    if (body.filename == "res://Scenes/EnemyFootman.tscn"):
        body.health = 0;
        trap_hold -= 1;
