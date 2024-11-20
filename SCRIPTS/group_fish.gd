extends Area2D
#
#@export var growth_value:float
@export var velocity:int 
#@export var valuerequiredtobeeaten:int
@onready var fish_1 = $fish_1
@onready var fish_2 = $fish_2
@onready var fish_3 = $fish_3
@onready var fish_4 = $fish_4
@onready var fish_5 = $fish_5
@onready var fish_6 = $fish_6

func _ready():
	fish_1.area_entered.connect(on_small_fish_1_area_entered)
	fish_2.area_entered.connect(on_small_fish_2_area_entered)
	fish_3.area_entered.connect(on_small_fish_3_area_entered)
	fish_4.area_entered.connect(on_small_fish_4_area_entered)
	fish_5.area_entered.connect(on_small_fish_5_area_entered)
	fish_6.area_entered.connect(on_small_fish_6_area_entered)
	
func _process(delta):
	position.x -= velocity * delta
	
	if position.x <= -170:
		queue_free()
		
func on_small_fish_1_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_1.queue_free()
		
func on_small_fish_2_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_2.queue_free()

func on_small_fish_3_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_3.queue_free()

func on_small_fish_4_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_4.queue_free()
	
func on_small_fish_5_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_5.queue_free()
	
func on_small_fish_6_area_entered(area:Area2D):
	if area.is_in_group("player"):
		fish_6.queue_free()
