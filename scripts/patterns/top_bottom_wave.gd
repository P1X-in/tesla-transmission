extends "res://scripts/patterns/abstract_pattern.gd"

var amount

func _init(timers, enemies, cache, amount).(timers, enemies, cache):
    self.amount = amount

    self.generate_waves()


func apply(params):
    self.amount = params['amount']

    self.generate_waves()

func generate_waves():
    for i in range(self.amount):
        self.pattern.append(self._generate_step())

func _generate_step():
    return {
        'path_type' : 'top_bottom_curve',
        'ship_type' : 'sulaco',
        'timeout' : 1,
        'path_params' : {}
    }
