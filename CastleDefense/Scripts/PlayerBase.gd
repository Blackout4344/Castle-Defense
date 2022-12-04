extends Node2D

var FootmanScene : PackedScene = preload("res://Scenes/Footman.tscn");
var ArcherScene : PackedScene = preload("res://Scenes/Archer.tscn");

func _process(delta):
    $Units/Money.text = "Money: $" + str(Global.money)

func _on_Footman_pressed():
    if (Global.money >= 6):
        Global.money -= 6;
        var new_footman : KinematicBody2D = FootmanScene.instance();
        new_footman.position = $FootmanLocation.position;
        add_child(new_footman);

func _on_Archer_pressed():
    if (Global.money >= 12):
        Global.money -= 12;
        var new_archer : KinematicBody2D = ArcherScene.instance();
        new_archer.position = $ArcherLocation.position;
        add_child(new_archer);
