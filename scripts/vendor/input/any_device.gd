
extends "res://scripts/vendor/input/abstract_device.gd"

func _can_handle_type(event):
    if event is InputEventMouseButton:
        return true
    elif event is InputEventJoypadButton:
        return true
    elif event is InputEventKey:
        return true

    return false
