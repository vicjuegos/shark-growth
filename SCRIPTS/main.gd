extends Node2D

const SMALL_FISH:PackedScene = preload("res://SCENES/enemies/small_fish.tscn")
const FAST_FISH:PackedScene = preload("res://SCENES/enemies/fast_fish.tscn")
const BIG_FISH:PackedScene = preload("res://SCENES/enemies/big_fish.tscn")
const GROUP_FISH:PackedScene = preload("res://SCENES/enemies/group_fish.tscn")
@onready var timer_enemeis:Timer = $timer_enemeis

func _ready():
	timer_enemeis.timeout.connect(on_timer_enemies_timeout)
	
func _process(_delta):
	if timer_enemeis.wait_time <= 0.5:
		timer_enemeis.wait_time = 0.5
		
func random_enmeies():
		
	randomize()
	var random_enemy:int = round(randf_range(0,13))
	
	if random_enemy <= 6:
		var new_s_fish:Area2D = SMALL_FISH.instantiate()
		new_s_fish.global_position = Vector2(451,randf_range(-82,294))
		add_sibling(new_s_fish)
		timer_enemeis.wait_time -= 0.05
	if random_enemy <= 8:
		if random_enemy >= 7:
			var new_m_fish:Area2D = FAST_FISH.instantiate()
			new_m_fish.global_position = Vector2(451,randf_range(-82,294))
			add_sibling(new_m_fish)
			timer_enemeis.wait_time -= 0.05
					
	if random_enemy == 9:
		var new_b_fish:Area2D = BIG_FISH.instantiate()
		new_b_fish.global_position = Vector2(451,randf_range(-82,294))
		add_sibling(new_b_fish)
		timer_enemeis.wait_time -= 0.05
		
	if random_enemy >= 10:
		var new_g_fish:Node2D = GROUP_FISH.instantiate()
		new_g_fish.global_position = Vector2(451,randf_range(-82,294))
		add_sibling(new_g_fish)
		timer_enemeis.wait_time -= 0.05
		
func on_timer_enemies_timeout():
	random_enmeies()
