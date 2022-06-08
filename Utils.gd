extends Node


func get_sprite_by_texture(texture):
	var ret = null
	print(texture)
	match(texture.resource_path):
		"res://art/chars/p1_0.png":
			print("BARRIER")
			return "res://SomethingBarrier.tscn"
		"res://art/chars/p2_0.png":
			print("GEN")
			return "res://SomethingGenerator.tscn"
		"res://art/chars/p3_0.png":
			print("TNT")
			return "res://SomethingTNT.tscn"
		"res://art/chars/ninja.png":
			print("Ninja")
			return "res://SomethingNinja.tscn"
		"res://art/chars/p4_0.png":
			print("Electric")
			return "res://SomethingElectric.tscn"
		"res://art/zombies/Player_Free/Run_Shoot/0042.png":
			print("BIG")
			return "res://SomethingShooterBig.tscn"
		"res://art/zombies/Player_Free/Idle_Shoot/0074.png":
			print("Shoot")
			return "res://SomethingShooter.tscn"
		"res://art/chars/catapult/catapult.png":
			print("CATA")
			return "res://SomethingCatapult.tscn"
		"res://art/chars/knight.png":
			print("Knight")
			return "res://SomethingKnight.tscn"
		"res://art/chars/p5_0.png":
			print("MULTI GEN")
			return "res://SomethingGeneratorMulti.tscn"
		"res://art/chars/frog.png":
			print("FROG")
			return "res://SomethingFrog.tscn"
	
	return ret
