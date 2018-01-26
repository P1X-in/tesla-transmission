extends "res://scripts/vendor/input/abstract_device.gd"

func _init(device_id):
    self.device_id = device_id

func _can_handle_type(event):
    if event is InputEventJoypadMotion:
        return true
    elif event is InputEventJoypadButton:
        return true

    return false
