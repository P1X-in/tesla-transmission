
var ship = null
var director
var players

var is_in_game = false
var is_alive = true

func use_ship(ship):
    self.ship = ship
    self.ship.player = self

func bind_controls(input):
    self._bind_keyboard_left_side(input)

func enter_game():
    if self.ship == null or self.is_in_game:
        return

    self.is_in_game = true
    self.ship.spawn(Vector3(0, 2, 0))
    self.director.start()

func reset():
    self.is_in_game = false
    self.is_alive = true


func _bind_keyboard_left_side(input):
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/enter_game_keyboard.gd").new(self, KEY_1))

    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "x", 1, KEY_D))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "x", -1, KEY_A))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "y", 1, KEY_W))
    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/move_keyboard.gd").new(self, "y", -1, KEY_S))


    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/shoot_keyboard.gd").new(self, KEY_V))

    input.register_handler('game', input.DEVICE_KEYBOARD, preload("res://scripts/input/handlers/tesla_keyboard.gd").new(self, KEY_C))


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
