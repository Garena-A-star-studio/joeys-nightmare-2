extends Control


var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500
enum card_state{following,dragging}

@onready var button: Button = $Button

@export var card_current_state = card_state.following

@export var follow_target :Node2D



func _process(_delta:float)->void:
	match card_current_state:
		card_state.dragging:
			var target_position = get_global_mouse_position() -size/2 
			global_position = global_position.lerp(target_position,0.4)
		card_state.following:
			if follow_target !=null:
				var target_position = follow_target.global_position
				var displacement = target_position - global_position
				var force =displacement * stiffness
				velocity += force * _delta
				velocity *=(1-damping)
				global_position += velocity * _delta



func _on_button_button_down() -> void:
	card_current_state = card_state.dragging


func _on_button_button_up() -> void:
	card_current_state = card_state.following
