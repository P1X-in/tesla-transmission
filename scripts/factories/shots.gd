extends "res://scripts/vendor/bag_aware.gd"

var shot_templates = {
    'laser' : preload("res://scripts/entities/shot.gd"),
    'laser_red' : preload("res://scripts/entities/red_laser.gd"),
    'tesla_shot' : preload("res://scripts/entities/tesla_shot.gd"),
}

func get(type):
    var shot = self.bag.cache.request(type)

    if shot == null:
        shot = self._build_new_shot(type)
    else:
        shot.reset()

    return shot

func _build_new_shot(type):
    var shot = null

    if not self.shot_templates.has(type):
        return null

    shot = self.shot_templates[type].new(self.bag.board, self.bag.processing, self.bag.cache)

    return shot

func preload():
    var shot
    for type in self.shot_templates:
        shot = self.get(type)
        shot.attach()
        shot.detach()
