extends "res://scripts/patterns/paths/abstract_path.gd"

func _init(altitude):
    self.initial_position = Vector3(300, altitude, -100)

    self.path['waypoint1'] = {
        'target' : Vector3(0, altitude, -30),
        'speed' : 100,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 1,
        'next' : 'waypoint2'
    }

    self.path['waypoint2'] = {
        'target' : Vector3(0, altitude, 1),
        'speed' : 50,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 1,
        'next' : 'waypoint3'
    }

    self.path['waypoint3'] = {
        'target' : Vector3(0, altitude, 1),
        'speed' : 50,
        'shooting' : true,
        'despawn' : true,
        'threshold' : 0.1,
        'shot_cooldown' : 1,
        'next' : null
    }
