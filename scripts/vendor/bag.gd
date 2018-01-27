
var root

var file_handler = preload('res://scripts/vendor/file_handler.gd').new()
var processing = preload('res://scripts/vendor/processing.gd').new()
var timers = preload('res://scripts/vendor/timers.gd').new()
var input = preload("res://scripts/vendor/input/input.gd").new()
var cache = preload("res://scripts/vendor/cache.gd").new()
#var sounds = preload("res://scripts/vendor/sounds.gd").new()

func _init_bag(root):
    self.root = root

    self._pre_initialize()

    self.processing._init_bag(self)
    self.timers._init_bag(self)
    self.input._init_bag(self)
    #self.sounds._init_bag(self)

    self._initialize()

func _pre_initialize():
    return

func _initialize():
    return

func reset():
    return
