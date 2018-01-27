
var timers
var patterns_factory

var iterator = 0
var started = false

var waves = [
    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 2,
            'amount' : 3
        },
        'delay' : 3
    },
]


func _initialize(timers, factory):
    self.tiemrs = timers
    self.patterns_factory = factory

func start():
    self.started = true
    self.iterator = 0

    self._perform_next_wave()

func abort():
    self.started = false
    self.iterator = 0

func _perform_next_wave():
    if self.is_finished() or not self.started:
        return

    self._perofrm_wave()
    var delay = self.pattern[self.iterator]['delay']
    self.iterator += 1

    self.timers.set_timeout(delay, self, '_perform_next_wave')

func _perofrm_wave():
    var wave_data = self.waves[self.iterator]

    var pattern = self.patterns_factory.get(wave_data['type'], wave_data['params'])
    pattern.begin()

func is_finished():
    return self.iterator == self.waves.size()
