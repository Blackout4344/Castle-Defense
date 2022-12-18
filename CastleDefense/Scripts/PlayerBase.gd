extends Node2D

export var health : float;

var FootmanScene : PackedScene = preload("res://Scenes/Footman.tscn");
var ArcherScene : PackedScene = preload("res://Scenes/Archer.tscn");
var DitchScene : PackedScene = preload("res://Scenes/Ditch.tscn");
var KnightScene : PackedScene = preload("res://Scenes/Knight.tscn");
var BigMonkeScene : PackedScene = preload("res://Scenes/BigMonke.tscn");

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
		new_footman.z_index = -1;
		add_child(new_footman);

func _on_Archer_pressed():
	if (Global.money >= 20):
		Global.money -= 20;
		var new_archer : KinematicBody2D = ArcherScene.instance();
		new_archer.position = $ArcherLocation.position;
		new_archer.z_index = -1;
		add_child(new_archer);
		
func _on_Ditch_pressed():
	if (Global.money >= 12):
		Global.money -= 12;
		var new_ditch : StaticBody2D = DitchScene.instance();
		new_ditch.position = $DitchLocation.position;
		new_ditch.z_index = -1;
		add_child(new_ditch);
		
func _on_Knight_pressed():
	if (Global.money >= 12):
		Global.money -= 12;
		var new_knight : KinematicBody2D = KnightScene.instance();
		new_knight.position = $KnightLocation.position;
		new_knight.z_index = -1;
		add_child(new_knight);

func _on_BigMonke_pressed():
	if (Global.money >= 30):
		Global.money -= 30;
		var new_bigmonke : KinematicBody2D = BigMonkeScene.instance();
		new_bigmonke.position = $BigMonkeLocation.position;
		new_bigmonke.z_index = -1;
		add_child(new_bigmonke);
