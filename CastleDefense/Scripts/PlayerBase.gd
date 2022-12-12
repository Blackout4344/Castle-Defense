extends Node2D


export var health : float;

var FootmanScene : PackedScene = preload("res://Scenes/Footman.tscn");
var ArcherScene : PackedScene = preload("res://Scenes/Archer.tscn");
var DitchScene : PackedScene = preload("res://Scenes/Ditch.tscn");

func _process(delta):
	$Units/Money.text = "Money: $" + str(Global.money)
	if (health <= 0):
		queue_free();
	$HealthBar.value = health;

func _ready():
	$HealthBar.max_value = health;

func _on_ShowUnitsShop_pressed():
	$ShowUnitsShop.visible = false;
	$Units.visible = true;
	
func _on_HideUnitsShop_pressed():
	$Units.visible = false;
	$ShowUnitsShop.visible = true;

func _on_Footman_pressed():
	if (Global.money >= 6):
		Global.money -= 6;
		var new_footman : KinematicBody2D = FootmanScene.instance();
		new_footman.position = $FootmanLocation.position;
		add_child(new_footman);

func _on_Archer_pressed():
	if (Global.money >= 20):
		Global.money -= 20;
		var new_archer : KinematicBody2D = ArcherScene.instance();
		new_archer.position = $ArcherLocation.position;
		add_child(new_archer);
		
func _on_Ditch_pressed():
	if (Global.money >= 12):
		Global.money -= 12;
		var new_ditch : StaticBody2D = DitchScene.instance();
		new_ditch.position = $DitchLocation.position;
		add_child(new_ditch);
