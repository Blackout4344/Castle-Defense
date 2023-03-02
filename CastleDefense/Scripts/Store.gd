extends Popup

var FootmanScene : PackedScene = preload("res://Scenes/Footman.tscn");
var ArcherScene : PackedScene = preload("res://Scenes/Archer.tscn");
var DitchScene : PackedScene = preload("res://Scenes/Ditch.tscn");
var KnightScene : PackedScene = preload("res://Scenes/Knight.tscn");
var BigMonkeScene : PackedScene = preload("res://Scenes/BigMonke.tscn");

onready var footmanLocation = null
onready var archerLocation = null
onready var ditchLocation = null
onready var knightLocation = null
onready var bigmonkeLocation = null

func _process(delta):
	$Money.text = "Money: $" + str(Global.money)

func _ready():
	pass
	#popup_centered()

func initialize(FLocation, ALocation, DLocation, KLocation, BMLocation):
	footmanLocation = FLocation
	archerLocation = ALocation
	ditchLocation = DLocation
	knightLocation = KLocation
	bigmonkeLocation = BMLocation
	


func _on_Button_pressed():
	hide()
	var open_button = get_parent().get_node("ShowUnitsShop")
	open_button.show()



func _on_Footman_pressed():
	if (Global.money >= 6):
		Global.money -= 6;
		var new_footman : KinematicBody2D = FootmanScene.instance();
		new_footman.position = footmanLocation.position;
		new_footman.z_index = -1;
		get_parent().add_child(new_footman);
		



func _on_Archer_pressed():
	if (Global.money >= 20):
		Global.money -= 20;
		var new_archer : KinematicBody2D = ArcherScene.instance();
		new_archer.position = archerLocation.position;
		new_archer.z_index = -1;
		get_parent().add_child(new_archer);


func _on_Knight_pressed():
	if (Global.money >= 12):
		Global.money -= 12;
		var new_knight : KinematicBody2D = KnightScene.instance();
		new_knight.position = knightLocation.position;
		new_knight.z_index = -1;
		get_parent().add_child(new_knight);


func _on_BigMonke_pressed():
	if (Global.money >= 30):
		Global.money -= 30;
		var new_bigmonke : KinematicBody2D = BigMonkeScene.instance();
		new_bigmonke.position = bigmonkeLocation.position;
		new_bigmonke.z_index = -1;
		get_parent().add_child(new_bigmonke);


func _on_Ditch_pressed():
	if (Global.money >= 12):
		Global.money -= 12;
		var new_ditch : StaticBody2D = DitchScene.instance();
		new_ditch.position = ditchLocation.position;
		new_ditch.z_index = -1;
		get_parent().add_child(new_ditch);
