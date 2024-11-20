extends ParallaxBackground

var velocity:int = 50
@onready var timerparallaxvelocity = $"../timerparallaxvelocity"

func _ready():
	timerparallaxvelocity.timeout.connect(on_background_timeout)
	
func _process(delta):
	scroll_base_offset.x -= velocity * delta
	
func on_background_timeout():
	if velocity < 200:
		var tween_velocity:Tween = get_tree().create_tween()
		tween_velocity.tween_property(self,"velocity",velocity + 50,5.0)
	if timerparallaxvelocity.wait_time > 2.0:
		timerparallaxvelocity.wait_time -= 0.2
