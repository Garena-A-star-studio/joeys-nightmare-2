extends Control


var velocity = Vector2.ZERO
var damping = 15
var stiffness = 800
var drag_offset = Vector2.ZERO
enum card_state{following,dragging}

@onready var button: Button = $Button

@export var card_current_state = card_state.following

@export var follow_target :Node2D



func _process(_delta:float)->void:
	match card_current_state:
		card_state.dragging:
			var target_position = get_global_mouse_position() - drag_offset 
			global_position = global_position.lerp(target_position,0.4)
		card_state.following:
			if follow_target !=null:
				var target_position = follow_target.global_position
				var displacement = target_position - global_position
				var force =displacement * stiffness
				velocity += force * _delta
				velocity -= velocity * damping * _delta
				global_position += velocity * _delta



func _on_button_button_down() -> void:
	drag_offset = get_global_mouse_position() - global_position
	card_current_state = card_state.dragging


func _on_button_button_up() -> void:
	card_current_state = card_state.following
