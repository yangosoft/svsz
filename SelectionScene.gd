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
	$Stats/lblName.text = "Barrier"
	$Stats/lblLife.text = "300"
	$Stats/lblStrength.text = "0"
	$Stats/lblCadence.text = "0"
	$Stats/pBarLife.value = 300
	$Stats/pBarStrength.value = 0
	$Stats/pBarCadence.value = 0
	
	
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
	$Stats/lblName.text = "StarGen"
	$Stats/lblLife.text = "100"
	$Stats/lblStrength.text = "0"
	$Stats/lblCadence.text = "0"
	$Stats/pBarLife.value = 100
	$Stats/pBarStrength.value = 0
	$Stats/pBarCadence.value = 0
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect3,$GridContainer/TextureRect3/Label)
		

func on_BigShoot_Sel(event):
	$Stats/lblName.text = "ShooterBig"
	$Stats/lblLife.text = "100"
	$Stats/lblStrength.text = "100"
	$Stats/lblCadence.text = "3000"
	$Stats/pBarLife.value = 300
	$Stats/pBarStrength.value = 100
	$Stats/pBarCadence.value = 3000
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect5,$GridContainer/TextureRect5/Label)
	pass # Replace with function body.


func on_Catapult_Sel(event):
	$Stats/lblName.text = "Catapult"
	$Stats/lblLife.text = "50"
	$Stats/lblStrength.text = "100"
	$Stats/lblCadence.text = "3000"
	$Stats/pBarLife.value = 50
	$Stats/pBarStrength.value = 100
	$Stats/pBarCadence.value = 3000
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect7,$GridContainer/TextureRect7/Label)
	pass # Replace with function body.


func on_TNT_Sel(event):
	$Stats/lblName.text = "TNT"
	$Stats/lblLife.text = "0"
	$Stats/lblStrength.text = "400"
	$Stats/lblCadence.text = "0"
	$Stats/pBarLife.value = 0
	$Stats/pBarStrength.value = 400
	$Stats/pBarCadence.value = 0
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect2,$GridContainer/TextureRect2/Label)
	pass # Replace with function body.


func on_Electric_Sel(event):
	$Stats/lblName.text = "Electric"
	$Stats/lblLife.text = "100"
	$Stats/lblStrength.text = "10"
	$Stats/lblCadence.text = "2000"
	$Stats/pBarLife.value = 100
	$Stats/pBarStrength.value = 10
	$Stats/pBarCadence.value = 2000
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect4,$GridContainer/TextureRect4/Label)


func on_Something_Sel(event):
	$Stats/lblName.text = "Shooter"
	$Stats/lblLife.text = "100"
	$Stats/lblStrength.text = "21"
	$Stats/lblCadence.text = "3000"
	$Stats/pBarLife.value = 100
	$Stats/pBarStrength.value = 21
	$Stats/pBarCadence.value = 3000
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect6,$GridContainer/TextureRect6/Label)


func on_Ninja_Sel(event):
	$Stats/lblName.text = "Ninja"
	$Stats/lblLife.text = "150"
	$Stats/lblStrength.text = "10"
	$Stats/lblCadence.text = "800"
	$Stats/pBarLife.value = 150
	$Stats/pBarStrength.value = 10
	$Stats/pBarCadence.value = 800
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect8,$GridContainer/TextureRect8/Label)


func on_Knight_Sel(event):
	$Stats/lblName.text = "Knight"
	$Stats/lblLife.text = "200"
	$Stats/lblStrength.text = "35"
	$Stats/lblCadence.text = "900"
	$Stats/pBarLife.value = 200
	$Stats/pBarStrength.value = 35
	$Stats/pBarCadence.value = 900
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect9,$GridContainer/TextureRect9/Label)


func _on_Button_pressed():
	if selection_array.size() <= 0:
		return
	emit_signal("selection_done",selection_array)
	$AudioStreamPlayer.play()
	self.hide()
	pass # Replace with function body.


func on_MultiStar_Sel(event):
	$Stats/lblName.text = "MultiStarGen"
	$Stats/lblLife.text = "20"
	$Stats/lblStrength.text = "0"
	$Stats/lblCadence.text = "0"
	$Stats/pBarLife.value = 20
	$Stats/pBarStrength.value = 0
	$Stats/pBarCadence.value = 0
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect10,$GridContainer/TextureRect10/Label)
