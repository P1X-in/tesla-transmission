
var ship = null
var director
var players

var index

var is_in_game = false
var is_alive = true

func _init(index):
    self.index = index

func use_ship(ship):
    self.ship = ship
    self.ship.player = self

func bind_controls(input):
    if self.index == 0:
        self._bind_keyboard_left_side(input)

    self._bind_gamepad(input)

func enter_game():
    if self.ship == null or self.is_in_game:
        return

    self.is_in_game = true
    self.ship.spawn(Vector3(0, 2, 0))
    self.director.start()

func reset():
    self.is_in_game = false
    self.is_alive = true

func set_shooting(shooting):
    if not self.is_active():
        return

    self.ship.shooting = shooting

func set_tesla_shooting(shooting):
    if not self.is_active():
        return

    self.ship.tesla_shooting = shooting

func get_position_for_enemy():
    if not self.is_active():
        return null

    return self.ship.get_pos()

func is_active():
    if self.ship == null or not self.is_in_game or not self.is_alive:
        return false

    return true

func swap_ship(name):
    self.players.swap_ship_for_player(self, name)



func _bind_keyboard_left_side(input):
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/enter_game_keyboard.gd").new(self, KEY_1))

    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "x", 1, KEY_D))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "x", -1, KEY_A))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "y", 1, KEY_W))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "y", -1, KEY_S))


    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/shoot_keyboard.gd").new(self, KEY_V))

    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/tesla_keyboard.gd").new(self, KEY_C))

func _bind_gamepad(input):
    input.register_handler('game', input.DEVICE_GAMEPAD, preload("res://scripts/input/handlers/enter_game_gamepad.gd").new(JOY_BUTTON_9, self), self.index)

    input.register_handler('game', input.DEVICE_GAMEPAD, preload("res://scripts/input/handlers/move_gamepad.gd").new(self), self.index)

    input.register_handler('game', input.DEVICE_GAMEPAD, preload("res://scripts/input/handlers/shoot_gamepad.gd").new(JOY_BUTTON_0, self), self.index)

    input.register_handler('game', input.DEVICE_GAMEPAD, preload("res://scripts/input/handlers/tesla_gamepad.gd").new(JOY_BUTTON_1, self), self.index)
