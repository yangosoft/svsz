extends Control

var selection_array = Array()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_Barrier_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect1)
	pass # Replace with function body.


func _on_BtnReset_pressed():
	print("REST")
	selection_array.clear()
	$DefenseGroup/Something0.texture = null
	$DefenseGroup/Something0/Label.text = ""
	$DefenseGroup/Something1.texture = null
	$DefenseGroup/Something1/Label.text = ""
	$DefenseGroup/Something2.texture = null
	$DefenseGroup/Something2/Label.text = ""
	$DefenseGroup/Something3.texture = null
	$DefenseGroup/Something3/Label.text = ""
	$DefenseGroup/Something4.texture = null
	$DefenseGroup/Something4/Label.text = ""
	$DefenseGroup/Something5.texture = null
	$DefenseGroup/Something5/Label.text = ""
	$DefenseGroup/Something6.texture = null
	$DefenseGroup/Something6/Label.text = ""
	
	var c = $GridContainer.get_children()
	for i in range(c.size()):
		c[i].modulate.a = 1
	
	draw_selection()
	pass # Replace with function body.
	
func draw_selection():
	for i in range(selection_array.size()):
		var s = selection_array[i]
		get_node("DefenseGroup/Something"+str(i)).texture = s
		
	pass

func select_defender(node):
	if selection_array.size() == 7:
		return
	var res = node.texture
	if selection_array.find(res) == -1:
		selection_array.push_back(res)
		node.modulate.a = 0.5
		draw_selection()

func on_Star_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect3)
		

func on_BigShoot_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect5)
	pass # Replace with function body.


func on_Catapult_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect7)
	pass # Replace with function body.


func on_TNT_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect2)
	pass # Replace with function body.


func on_Electric_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect4)


func on_Something_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect6)


func on_Ninja_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect8)
