extends "res://scripts/patterns/abstract_pattern.gd"

var distance

func _init(timers, enemies, cache, distance).(timers, enemies, cache):
    self.distance = distance

    self.generate_waves()


func apply(params):
    self.distance = params['distance']

    self.generate_waves()

func generate_waves():
    for i in range(3):
        self.pattern.append(self._generate_step(i))

func _generate_step(index):
    return {
        'path_type' : 'side_to_side',
        'ship_type' : 'basilisk',
        'timeout' : 1,
        'path_params' : {
            'altitude' : index * 3 + 3,
            'distance' : self.distance
        }
    }
