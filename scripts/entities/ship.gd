
var avatar

func bind(test_scene):
    self.avatar = test_scene.get_node('player')

func move_left():
    var translation = self.avatar.get_translation()

    translation.x -= 1

    self.avatar.set_translation(translation)

func move_right():
    var translation = self.avatar.get_translation()

    translation.x += 1

    self.avatar.set_translation(translation)
