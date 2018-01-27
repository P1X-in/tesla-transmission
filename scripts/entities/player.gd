
var ship = preload("res://scripts/entities/ship.gd").new(Object(), Object())

func bind_controls(input):
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_left_keyboard.gd").new(self.ship))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_right_keyboard.gd").new(self.ship))
