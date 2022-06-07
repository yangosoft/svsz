extends Control

var selection_array = Array()
var selection_array_stars = Array()
signal selection_done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_Barrier_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect1, $GridContainer/TextureRect1/Label)
	pass # Replace with function body.


func _on_BtnReset_pressed():
	$AudioStreamPlayer.play()
	print("REST")
	selection_array.clear()
	selection_array_stars.clear()
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
	var childs = $DefenseGroup.get_children()
	for i in range(childs.size()):
		var c = childs[i]
		c.texture = null
		c.get_child(0).text = ""
	
	for i in range(selection_array.size()):
		var s = selection_array[i]
		var star_value = selection_array_stars[i]
		get_node("DefenseGroup/Something"+str(i)).texture = s
		get_node("DefenseGroup/Something"+str(i)+"/Label").text = star_value
		
	pass

func select_defender(node, lbl_stars):
	if selection_array.size() == 7:
		return
	var res = node.texture
	if selection_array.find(res) == -1:
		$AudioStreamPlayer.play()
		selection_array.push_back(res)
		var val_stars = lbl_stars.text
		selection_array_stars.push_back(val_stars)
		node.modulate.a = 0.5
		draw_selection()

func on_Star_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect3,$GridContainer/TextureRect3/Label)
		

func on_BigShoot_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect5,$GridContainer/TextureRect5/Label)
	pass # Replace with function body.


func on_Catapult_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect7,$GridContainer/TextureRect7/Label)
	pass # Replace with function body.


func on_TNT_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect2,$GridContainer/TextureRect2/Label)
	pass # Replace with function body.


func on_Electric_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect4,$GridContainer/TextureRect4/Label)


func on_Something_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect6,$GridContainer/TextureRect6/Label)


func on_Ninja_Sel(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect8,$GridContainer/TextureRect8/Label)


func _on_Button_pressed():
	if selection_array.size() <= 0:
		return
	emit_signal("selection_done",selection_array)
	$AudioStreamPlayer.play()
	self.hide()
	pass # Replace with function body.
