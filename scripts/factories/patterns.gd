extends "res://scripts/vendor/bag_aware.gd"

var wave_templates = {
    'side_front_wave' : preload("res://scripts/patterns/side_front_wave.gd")
}

func get(type, params):
    var pattern = self._get_pattern(type, params)

    return pattern


func _get_pattern(type, params):
    var pattern = self.bag.cache.request(type)

    if pattern == null:
        pattern = self._build_new_pattern(type, params)
    else:
        pattern.reset()
        pattern.apply(params)

    return pattern

func _build_new_pattern(type, params):
    var pattern = null

    if type == 'side_front_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['altitude'], params['amount'])
    else:
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory)

    return pattern

