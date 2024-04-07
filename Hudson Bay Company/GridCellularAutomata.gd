extends GridContainer
var Cell = preload("res://Cell.tscn")

var cellular_automata_db

func _ready():
	cellular_automata_db = load("res://CellularAutomataDB.gd").new()

	populate_grid()

func populate_grid():
	for y in range(54):
		for x in range(105):
			var cell = Cell.instance()
			add_child(cell)
			cell.initialize(x, y, cellular_automata_db)
