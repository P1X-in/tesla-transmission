extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

var button_index

func can_handle(event):
    if event is InputEventJoypadButton and self.button_index == event.button_index:
        return true

    return false
