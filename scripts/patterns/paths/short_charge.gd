extends "res://scripts/patterns/paths/abstract_path.gd"

func _init(altitude):
    self.initial_position = Vector3(100, altitude, -60)

    self.path['waypoint1'] = {
        'target' : Vector3(10, altitude, -60),
        'speed' : 50,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : 'waypoint2'
    }

    self.path['waypoint2'] = {
        'target' : Vector3(10, altitude, 10),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : 'waypoint3'
    }

    self.path['waypoint3'] = {
        'target' : Vector3(10, altitude, 10),
        'speed' : 25,
        'shooting' : false,
        'despawn' : true,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : null
    }
