extends Reference
var cellular_automata_rules = [
	{"name": "Rule 30", "rule": "11101110"},
	{"name": "Rule 90", "rule": "01011010"},
	{"name": "Rule 110", "rule": "11111110"}
]

func get_rule(name):
	for rule in cellular_automata_rules:
		if rule["name"] == name:
			return rule["rule"]
