extends "res://scripts/vendor/bag_aware.gd"

const DEVICE_KEYBOARD = 'keyboard'
const DEVICE_GAMEPAD = 'keyboard'
const DEVICE_MOUSE = 'mouse'
const DEVICE_ARCADE = 'arcade'
const DEVICE_ANY = 'any'


var keyboard_template = preload("res://scripts/services/input/keyboard.gd")
var gamepad_template = preload("res://scripts/services/input/gamepad.gd")
var mouse_template = preload("res://scripts/services/input/mouse.gd")
var arcade_template = preload("res://scripts/services/input/arcade.gd")
var any_device_template = preload("res://scripts/services/input/any_device.gd")

var schemes = {
    "default" : {
        "keyboard" : self.keyboard_template.new(),
    }
}

var active_scheme = "default"

func _initialize():
    self._load_basic_input()

func handle_event(event):
    for device in self.schemes[self.active_scheme]:
        if self.schemes[self.active_scheme][device].can_handle(event):
            self.schemes[self.active_scheme][device].handle_event(event)

func switch_to_scheme(scheme):
    self.active_scheme = scheme

func _load_basic_input():
    self.register_handler('default', 'keyboard', preload("res://scripts/services/input/handlers/quit.gd").new())
    self.load_input()

func create_scheme(name):
    if not self.schemes.has(name):
        self.schemes[name] = {}

func register_device(scheme, device, device_id=0):
    var device_instance = null

    if device == self.DEVICE_KEYBOARD:
        device_instance = self.keyboard_template.new()
    elif device == self.DEVICE_GAMEPAD:
        device_instance = self.gamepad_template.new(device_id)
    elif device == self.DEVICE_MOUSE:
        device_instance = self.mouse_template.new()
    elif device == self.DEVICE_ARCADE:
        device_instance = self.arcade_template.new()
    elif device == self.DEVICE_ANY:
        device_instance = self.any_device_template.new()

    if not self.schemes[scheme].has(device) and device_instance != null:
        self.schemes[scheme][device] = device_instance


func register_handler(scheme, device, handler):
    self.schemes[scheme][device].register_handler(handler)


func load_input():
    return
