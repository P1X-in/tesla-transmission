extends "res://scripts/vendor/bag_aware.gd"

var path_templates = {
    'side_front_curve' : preload("res://scripts/patterns/paths/side_front_curve.gd")
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
    else:
        path = self.path_templates[type].new()

    return path