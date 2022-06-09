extends Control


signal selection_done

var Utils = null
var mapTextureSprite = {}

func _init():
	Utils = load("res://Utils.gd").new()
		

# Called when the node enters the scene tree for the first time.
func _ready():
	var c = $GridContainer.get_children()
	for e in c:
		var s = load(Utils.get_sprite_by_texture(e.texture)).instance()
		mapTextureSprite[e.texture] = s
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_stats_by_texture(texture):
	var sprite = mapTextureSprite[texture]
	$Stats/lblName.text = sprite.something_name
	$Stats/lblLife.text = str(sprite.life)
	$Stats/lblStrength.text = str(sprite.strength)
	$Stats/lblCadence.text = str(sprite.attack_cadence_ms)
	$Stats/pBarLife.value = sprite.life
	$Stats/pBarStrength.value = sprite.strength
	$Stats/pBarCadence.value = sprite.attack_cadence_ms
	$RichTextLabel.bbcode_text = sprite.description

func on_Barrier_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect1.texture)
	
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect1, $GridContainer/TextureRect1/Label)
	pass # Replace with function body.


func _on_BtnReset_pressed():
	$AudioStreamPlayer.play()
	print("REST")
	Global.selection_array.clear()
	Global.selection_array_stars.clear()
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
	
	for i in range(Global.selection_array.size()):
		var s = Global.selection_array[i]
		var star_value = Global.selection_array_stars[i]
		get_node("DefenseGroup/Something"+str(i)).texture = s
		get_node("DefenseGroup/Something"+str(i)+"/Label").text = star_value
		
	pass

func select_defender(node, lbl_stars):
	if Global.selection_array.size() == 7:
		return
	var res = node.texture
	if Global.selection_array.find(res) == -1:
		$AudioStreamPlayer.play()
		Global.selection_array.push_back(res)
		var val_stars = lbl_stars.text
		Global.selection_array_stars.push_back(val_stars)
		node.modulate.a = 0.5
		draw_selection()

func on_Star_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect3.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect3,$GridContainer/TextureRect3/Label)
		

func on_BigShoot_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect5.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect5,$GridContainer/TextureRect5/Label)
	pass # Replace with function body.


func on_Catapult_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect7.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect7,$GridContainer/TextureRect7/Label)
	pass # Replace with function body.


func on_TNT_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect2.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect2,$GridContainer/TextureRect2/Label)
	pass # Replace with function body.


func on_Electric_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect4.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect4,$GridContainer/TextureRect4/Label)


func on_Something_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect6.texture)
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect6,$GridContainer/TextureRect6/Label)


func on_Ninja_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect8.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect8,$GridContainer/TextureRect8/Label)


func on_Knight_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect9.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect9,$GridContainer/TextureRect9/Label)


func _on_Button_pressed():
	if Global.selection_array.size() <= 0:
		return
	emit_signal("selection_done",Global.selection_array)
	$AudioStreamPlayer.play()
	self.hide()
	pass # Replace with function body.


func on_MultiStar_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect10.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect10,$GridContainer/TextureRect10/Label)


func on_Frog_Sel(event):
	set_stats_by_texture($GridContainer/TextureRect11.texture)
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT  and event.pressed:
		select_defender($GridContainer/TextureRect11,$GridContainer/TextureRect11/Label)
