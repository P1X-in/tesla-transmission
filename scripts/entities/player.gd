
var ship = null

var is_in_game = false

func use_ship(ship):
    self.ship = ship

func bind_controls(input):
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/enter_game_keyboard.gd").new(self, KEY_1))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_left_keyboard.gd").new(self.ship))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_right_keyboard.gd").new(self.ship))

func enter_game():
    if self.ship == null or self.is_in_game:
        return

    self.is_in_game = true
    self.ship.spawn(Vector3(0, 2, 0))

func reset():
    self.is_in_game = false
