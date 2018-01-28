extends "res://scripts/vendor/bag_aware.gd"

var wave_templates = {
    'side_front_wave' : preload("res://scripts/patterns/side_front_wave.gd"),
    'wall_wave' : preload("res://scripts/patterns/wall_wave.gd"),
    'top_bottom_wave' : preload("res://scripts/patterns/top_bottom_wave.gd"),
    'short_charge_wave' : preload("res://scripts/patterns/short_charge_wave.gd"),
    'square_charge_wave' : preload("res://scripts/patterns/square_charge_wave.gd"),
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

    if params.has('reversed'):
        pattern.reversed_x = params['reversed']
    if params.has('reversed_x'):
        pattern.reversed_x = params['reversed_x']
    if params.has('reversed_y'):
        pattern.reversed_y = params['reversed_y']

    return pattern

func _build_new_pattern(type, params):
    var pattern = null

    if type == 'side_front_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['altitude'], params['amount'])
    elif type == 'wall_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['distance'])
    elif type == 'top_bottom_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['amount'])
    elif type == 'short_charge_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['altitude'], params['amount'])
    elif type == 'square_charge_wave':
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory, params['distance'], params['amount'])
    else:
        pattern = self.wave_templates[type].new(self.bag.timers, self.bag.enemies, self.bag.paths_factory)

    return pattern

