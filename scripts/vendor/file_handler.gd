
var file = File.new()

func read(path):
    self.__create_file_if_not_exists(path)

    self.file.open(path, File.READ)
    var data = self.file.get_var()
    self.file.close()

    return data

func write(path, data):
    self.file.open(path, File.WRITE)
    self.file.store_var(data)
    self.file.close()

func __create_file_if_not_exists(path):
    if !file.file_exists(path):
        self.write(path, {'is_ok' : 1})

func read_text(path, skip_empty_lines=true):
    var lines = []
    var line

    if self.file.file_exists(path):
        self.file.open(path, File.READ)

        while !self.file.eof_reached():
            line = self.file.get_line()
            if !line.empty() or !skip_empty_lines:
                lines.append(line)

        self.file.close()

    return lines

