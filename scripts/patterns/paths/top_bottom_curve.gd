extends "res://scripts/patterns/paths/abstract_path.gd"

func _init():
    self.initial_position = Vector3(100, 20, -60)

    self.path['waypoint1'] = {
        'target' : Vector3(40, 15, -50),
        'speed' : 50,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : 'waypoint2'
    }

    self.path['waypoint2'] = {
        'target' : Vector3(20, 10, -40),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint3'
    }

    self.path['waypoint3'] = {
        'target' : Vector3(10, 5, -30),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint4'
    }
    self.path['waypoint4'] = {
        'target' : Vector3(0, 5, -20),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint5'
    }

    self.path['waypoint5'] = {
        'target' : Vector3(-10, 0, 4),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.5,
        'shot_cooldown' : 0.5,
        'next' : 'waypoint6'
    }

    self.path['waypoint6'] = {
        'target' : Vector3(-10, 0, 4),
        'speed' : 25,
        'shooting' : false,
        'despawn' : true,
        'threshold' : 0.5,
        'shot_cooldown' : 2,
        'next' : null
    }
