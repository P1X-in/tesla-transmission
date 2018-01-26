
var root

var file_handler = preload('res://scripts/services/file_handler.gd').new()
var processing = preload('res://scripts/services/processing.gd').new()
var timers = preload('res://scripts/services/timers.gd').new()
var input = preload("res://scripts/services/input/input.gd").new()
var sounds = preload("res://scripts/services/sounds.gd").new()

func _init_bag(root):
    self.root = root

    self._pre_initialize()

    self.processing._init_bag(self)
    self.timers._init_bag(self)
    self.input._init_bag(self)
    self.sounds._init_bag(self)

    self._initialize()

func _pre_initialize():
    return

func _initialize():
    return

func reset():
    return
