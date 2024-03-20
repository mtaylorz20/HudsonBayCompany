extends Node2D

var card_types = ["Farm", "Ferry", "TradingPost", "Trapper"]
var deck = []
var displayed_cards = []

func _ready():
	create_deck()
	shuffle_deck()
	display_cards()

func create_deck():
	for type in card_types:
		for _i in range(3):
			deck.append(type)

func shuffle_deck():
	randomize()
	deck.shuffle()

func display_cards():
	for i in range(5):  # Iterate over 5 slots
		var card_slot = get_node("CardPositioner/CardSlot" + str(i + 1))
		if card_slot != null:
			if deck.size() == 0:
				break
			var card = deck.pop_front()
			if card_slot.name == "Card SlotDeck":
				# Display the back face of the card
				card_slot.texture = load("res://assets/graphics/BackFace.png")
			else:
				# Display the front face of the card
				card_slot.texture = load("res://assets/graphics/BusinessCards/" + card + ".png")
			displayed_cards.append(card)
		else:
			print("Card slot not found:", "CardPositioner/CardSlot" + str(i + 1))


func _on_CardSelected(card_index):
	var selected_card = displayed_cards[card_index]
	print("Selected card: ", selected_card)
	# Add code to handle the card selection, e.g., add it to the player's hand
	displayed_cards.remove(card_index)
	display_cards()
	

func _on_CardSlot_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var card_index = int(get_node(".").name.replace("CardSlot", "")) - 1
		_on_CardSelected(card_index)


func _on_card_slot_2_gui_input(_event):
	pass # Replace with function body.


func _on_card_slot_3_gui_input(_event):
	pass # Replace with function body.


func _on_card_slot_4_gui_input(_event):
	pass # Replace with function body.
