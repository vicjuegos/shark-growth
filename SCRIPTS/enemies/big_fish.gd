extends Area2D

@export var growth_value:float
@export var velocity:int 
@export var valuerequiredtobeeaten:int

func _ready():
	self.area_entered.connect(on_small_fish_area_entered)
	
func _process(delta):
	position.x -= velocity * delta
	if position.x <= -170:
		queue_free()
		
func on_small_fish_area_entered(area:Area2D):
	if area.is_in_group("player"):
		if area.get_parent().growth >= valuerequiredtobeeaten:
			queue_free()
			
