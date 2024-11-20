extends Area2D

const TEXT_GOOD = preload("res://SCENES/gui/text_good.tscn")
signal dead
@onready var text_pos = $"../text_pos"

func _ready():
	self.area_entered.connect(on_small_shark_area_entered)
	
func on_small_shark_area_entered(area:Area2D):
	if area.is_in_group("consumable"):
		if get_parent().growth >= area.valuerequiredtobeeaten:
			get_parent().growth += area.growth_value
			var text = TEXT_GOOD.instantiate()
			text.global_position = text.position
			add_sibling(text)
		else:
			dead.emit()
