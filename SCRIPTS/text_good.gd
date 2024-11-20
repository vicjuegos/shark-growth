extends Sprite2D

@onready var final_position = $"../final_position"
@onready var sprite = $"."

func _ready():
	var text:Tween = get_tree().create_tween()
	text.tween_property(self,"position",final_position.position,0.2)
	text.tween_property(sprite,"modulate",Color(1,1,1,0),0.2)
	await text.finished
	queue_free()
