extends "res://scripts/vendor/input/input.gd"

func load_input():
    self.register_handler('default', self.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/start_keyboard.gd").new(self.bag))

    self.create_scheme("empty")

    self.create_scheme("game")
    self.register_device("game", self.DEVICE_KEYBOARD)

    self.register_handler('game', self.DEVICE_KEYBOARD, preload("res://scripts/vendor/input/handlers/quit.gd").new(self.bag.root))
    self.register_handler('game', self.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_left_keyboard.gd").new(self.bag))
    self.register_handler('game', self.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_right_keyboard.gd").new(self.bag))
