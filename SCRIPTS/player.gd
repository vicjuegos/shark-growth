extends CharacterBody2D

@export var speed:int
@export var cam_pos_subtract:Vector2

@export_group("growth")
@export var growth:float 
@export var growth_threshold:int

@export_group("shark_size")
@export var initial_scale:Vector2
@export var final_scale:Vector2
@export var scale_x:float
@export var scale_y:float

@export_group("colliders")
@export var character_collider_size_s:Vector2
@export var area_collider_size_s:Vector2
@export var character_collider_size_m:Vector2
@export var area_collider_size_m:Vector2

@onready var character_collider:CollisionShape2D = $character_collder
@onready var area_collider:CollisionShape2D = $area_player/area_collider
@onready var area_shark:Area2D = $area_player
@onready var anim:AnimatedSprite2D = $anim
@onready var cam:Camera2D = $cam
@onready var phase_cloud:Sprite2D = $PhaseCloud

func _ready():
	character_collider.shape.size = character_collider_size_s
	area_collider.shape.size = area_collider_size_s
	area_shark.dead.connect(on_small_shark_dead)
	cam.position = Vector2(66,1)
	
func _physics_process(_delta):
	$"../score/Label".text = str(growth)
	move()
	increase_size()
	
func move():
	if Input.is_action_pressed("down"):
		var rot:Tween = get_tree().create_tween()
		rot.tween_property(self,"rotation_degrees",20,0.2)
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		var rot:Tween = get_tree().create_tween()
		rot.tween_property(self,"rotation_degrees",-20,0.2)
		velocity.y = -speed
	
	else:
		var rot:Tween = get_tree().create_tween()
		rot.tween_property(self,"rotation_degrees",0,0.2)
		velocity.y = lerp(velocity.y,0.0,0.2)
		
	move_and_slide()
	
		
func increase_size():
	if growth >= growth_threshold and scale < final_scale:
		var t_growth:Tween = get_tree().create_tween()
		t_growth.tween_property(self,"scale", Vector2(scale_x,scale_y),0.5)
		var t_cam:Tween = get_tree().create_tween()
		t_cam.tween_property(cam,"offset",cam_pos_subtract,0.5)
		cam_pos_subtract.x -= 13
		growth_threshold += 100
		scale_x += 0.3
		scale_y += 0.3
	if scale >= final_scale:
		change_phase("medium",area_collider_size_m,character_collider_size_m,phase_cloud)
		final_scale.x += 2
		final_scale.y += 2
		
func change_phase(texture,a_collider,c_collider,cloud):
	character_collider.shape.size = c_collider
	area_collider.shape.size = a_collider
	anim.play(texture)
	var tween_cloud:Tween = get_tree().create_tween()
	tween_cloud.tween_property(cloud,"modulate",Color(1,1,1),0.2)
	tween_cloud.tween_property(cloud,"modulate",Color(1,1,1,0),0.2)
	
func on_small_shark_dead():
	print("has perdido")
	
