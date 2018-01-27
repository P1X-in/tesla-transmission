extends "res://scripts/vendor/input/input.gd"

func load_input():
    self.register_device('default', self.DEVICE_ANY)

    self.register_handler('default', self.DEVICE_ANY, preload("res://scripts/input/handlers/start_any.gd").new(self.bag.board))

    self.create_scheme("empty")

    self.create_scheme("game")
    self.register_device("game", self.DEVICE_KEYBOARD)
    self.register_device("game", self.DEVICE_ARCADE)
    self.register_device("game", self.DEVICE_GAMEPAD, 0)
    self.register_device("game", self.DEVICE_GAMEPAD, 1)

    self.register_handler('game', self.DEVICE_KEYBOARD, preload("res://scripts/vendor/input/handlers/quit.gd").new(self.bag.root))
