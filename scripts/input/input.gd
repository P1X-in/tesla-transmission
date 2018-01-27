extends "res://scripts/vendor/input/input.gd"

func load_input():
    self.register_handler('default', self.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/start_keyboard.gd").new(self.bag.board))

    self.create_scheme("empty")

    self.create_scheme("game")
    self.register_device("game", self.DEVICE_KEYBOARD)

    self.register_handler('game', self.DEVICE_KEYBOARD, preload("res://scripts/vendor/input/handlers/quit.gd").new(self.bag.root))
