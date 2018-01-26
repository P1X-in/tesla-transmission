
var device_id = null

var event_handlers = {}

func can_handle(event):
    if self._can_handle_type(event):
        if self.device_id != null:
            if event.device == self.device_id:
                return true
        else:
            return true
    return false

func register_handler(handler):
    self.event_handlers[handler.get_instance_id()] = handler

func remove_handler(handler):
    self.event_handlers.erase(handler.get_instance_id())

func handle_event(event):
    var handler
    for handler_id in self.event_handlers:
        handler = self.event_handlers[handler_id]
        if handler.can_handle(event):
            handler.handle(event)

func _can_handle_type(event):
    return true
