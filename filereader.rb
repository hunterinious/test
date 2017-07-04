class FileReader
  def read_from_file(file_source)
    current_path = File.dirname(__FILE__)
    file_path = current_path + file_source
    file = File.new(file_path, "r:UTF-8")
    lines = file.readlines
    file.close
    lines
  end
end
