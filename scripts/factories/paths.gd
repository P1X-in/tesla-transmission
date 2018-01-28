extends "res://scripts/vendor/bag_aware.gd"

var path_templates = {
    'side_front_curve' : preload("res://scripts/patterns/paths/side_front_curve.gd"),
    'side_to_side' : preload("res://scripts/patterns/paths/side_to_side.gd"),
    'top_bottom_curve' : preload("res://scripts/patterns/paths/top_bottom_curve.gd"),
    'short_charge' : preload("res://scripts/patterns/paths/short_charge.gd"),
    'square' : preload("res://scripts/patterns/paths/square.gd"),
}

func get(type, params):
    var path = self.bag.cache.request(type)

    if path == null:
        path = self._build_new_path(type, params)
    else:
        path.reset()
        path.apply(params)

    return path

func _build_new_path(type, params):
    var path = null

    if type == 'side_front_curve':
        path = self.path_templates[type].new(params['altitude'])
    elif type == 'side_to_side':
        path = self.path_templates[type].new(params['altitude'], params['distance'])
    elif type == 'short_charge':
        path = self.path_templates[type].new(params['altitude'])
    elif type == 'square':
        path = self.path_templates[type].new(params['distance'])
    else:
        path = self.path_templates[type].new()

    return path