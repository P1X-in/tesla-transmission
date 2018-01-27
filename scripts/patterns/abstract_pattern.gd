
var timers
var enemies
var cache

var pattern = []
var iterator

var pattern_name

func _init(timers, enemies, cache):
    self.timers = timers
    self.enemies = enemies
    self.cache = cache
    self.iterator = 0
    self._initialize()

func _initialize():
    return

func begin():
    return

func perform_next_step():
    if self.is_finished():
        return

    self._perform_step(self.iterator)
    var timeout = self.pattern[self.iterator]['timeout']
    self.iterator += 1

    self.timers.set_timeout(timeout)

func is_finished():
    return self.iterator == self.pattern.size()

func _perform_step(iteration):
    var pattern_step = self.pattern[self.iterator]
    var path = self._get_path(pattern_step['path_type'])
    var enemy = self.enemies.build_enemy(pattern_step['ship_type'], path)

    enemy.spawn()

func _get_path(type):
    return
