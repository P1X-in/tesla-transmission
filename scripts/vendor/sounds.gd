extends "res://scripts/vendor/bag_aware.gd"

var stream_player = StreamPlayer.new()
var sample_player = SamplePlayer.new()

var sound_volume = 0.5
var music_volume = 1.0

var samples = {}

var soundtracks = {}

func _initialize():
    self.sample_player.set_sample_library(SampleLibrary.new())
    self.sample_player.set_polyphony(64)

    self.bag.root.add_child(self.sample_player)

    self.sample_player.set_default_volume_db(self.sound_volume)

func play(name):
    if self.samples.has(name):
        self.sample_player.play(name)

func play_soundtrack(name):
    self.stop_soundtrack()

    self.stream_player.play()

func stop_soundtrack():
    self.stream_player.stop()

func can_play_sound():
    return !self.sample_player.is_active()

func register_sample(name, resource):
    self.samples[name] = resource
    self.sample_player.get_sample_library().add_sample(name, resource)
