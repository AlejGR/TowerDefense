extends Panel

@onready var tower = preload("res://Scenes/Turrets/RedBulletTower.tscn")
var	 currTile
var countChild = 0
func _on_gui_input(event):
	var temptower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1: #Left click down 
		print('Se ha presionado el boton izquierdo')
		add_child(temptower)
		countChild += 1
		print('Contador hijo',countChild)
		temptower.process_mode = Node.PROCESS_MODE_DISABLED
		print('Modo Proceso ', temptower.process_mode)
	elif event is InputEventMouseMotion and event.button_mask == 1: #Left Click down Drag
		get_child(countChild).global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0: #Left Click up 
		$TowerDefenseTile250/Cooldown.start()
		#get_child(countChild).process_mode = Node.PROCESS_MODE_ALWAYS
		print('Modo de proceso',temptower.process_mode)
		print('Se ha levantado presion en el boton izquierdo')


func _on_cooldown_timeout():
	print('Se activa la torre', countChild)
	get_child(countChild).process_mode = Node.PROCESS_MODE_ALWAYS
