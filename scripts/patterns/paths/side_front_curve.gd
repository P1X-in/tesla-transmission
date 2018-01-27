extends "res://scripts/patterns/paths/abstract_path.gd"

func _init(altitude):
    self.initial_position = Vector3(300, altitude, -60)

    self.path['waypoint1'] = {
        'target' : Vector3(30, altitude, -50),
        'speed' : 50,
        'shooting' : false,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : 'waypoint2'
    }

    self.path['waypoint2'] = {
        'target' : Vector3(20, altitude, -45),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : 'waypoint3'
    }

    self.path['waypoint3'] = {
        'target' : Vector3(10, altitude, -35),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : 'waypoint4'
    }
    self.path['waypoint4'] = {
        'target' : Vector3(0, altitude, -20),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : 'waypoint5'
    }

    self.path['waypoint5'] = {
        'target' : Vector3(-10, altitude, 4),
        'speed' : 25,
        'shooting' : true,
        'despawn' : false,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : 'waypoint6'
    }

    self.path['waypoint6'] = {
        'target' : Vector3(-10, altitude, 4),
        'speed' : 25,
        'shooting' : false,
        'despawn' : true,
        'threshold' : 0.1,
        'shot_cooldown' : 2,
        'next' : null
    }
