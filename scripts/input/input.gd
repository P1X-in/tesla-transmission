extends "res://scripts/vendor/input/input.gd"

func load_input():
    self.register_handler('default', self.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/start_keyboard.gd").new(self.bag))

    self.create_scheme("empty")


func lock_input():
    self.switch_to_scheme("empty")

func unlock_input():
    self.switch_to_scheme("default")

func temp_lock_input():
    self.lock_input()
    self.bag.timers.set_timeout(1, self, "unlock_input")
