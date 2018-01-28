extends "res://scripts/patterns/paths/abstract_path.gd"

func _init(distance):
    self.initial_position = Vector3(100, 10, distance)

    self.path['waypoint1'] = {
        'target' : Vector3(20, 10, distance),
        'speed' : 50,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : 'waypoint2'
    }

    self.path['waypoint2'] = {
        'target' : Vector3(-10, 10, distance),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint3'
    }

    self.path['waypoint3'] = {
        'target' : Vector3(-10, 2, distance),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint4'
    }
    self.path['waypoint4'] = {
        'target' : Vector3(10, 2, distance),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint5'
    }

    self.path['waypoint5'] = {
        'target' : Vector3(10, 6, distance),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint6'
    }

    self.path['waypoint6'] = {
        'target' : Vector3(0, 6, distance),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint7'
    }

    self.path['waypoint7'] = {
        'target' : Vector3(0, 6, 10),
        'speed' : 25,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : 'waypoint8'
    }

    self.path['waypoint8'] = {
        'target' : Vector3(0, 6, 10),
        'speed' : 25,
        'shooting' : false,
        'despawn' : true,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : null
    }
