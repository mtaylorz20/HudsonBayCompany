extends Node2D

onready var grid_container = $GridContainer

const GRID_WIDTH = 105
const GRID_HEIGHT = 27
const CELL_SIZE = 10
const CELL_SPACING = 1

# ... (other parts of the script)
func setup_game():
	# Clear any existing cells in the GridContainer
	for child in grid_container.get_children():
		child.queue_free()
	
	# Set up the GridContainer dimensions and spacing
	grid_container.columns = GRID_WIDTH
	grid_container.set("custom_constants/hseparation", CELL_SPACING)
	grid_container.set("custom_constants/vseparation", CELL_SPACING)
	
	# Set up the initial grid cells
	for _i in range(GRID_HEIGHT):
		for _j in range(GRID_WIDTH):
			var cell = create_cell()
			grid_container.add_child(cell)
	
	# Set the initial cell states
	# ...
	
	current_state = GameState.PLAYER_INPUT

func create_cell():
	var cell = load("res://Cell.tscn").instance()
	
	# Connect the cell signal to the CellularAutomataBoard script
	cell.get_node("ColorRect").connect("cell_clicked", self, "_on_cell_clicked")
	
	return cell

func _on_cell_clicked(cell_index):
	var row = cell_index / GRID_WIDTH
	var col = cell_index % GRID_WIDTH

	if row == current_turn + 3:
		var cell = grid_container.get_child(cell_index)
		var cell_type = cell.cell_type
		# Update the game state based on the clicked cell type
		# ...
	else:
		print("Clicked cell is not in the valid row for the current turn.")

# ... (other parts of the script)
