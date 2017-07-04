# require производит поиск в папках, указанных в $LOAD_PATH (это такая глобальная переменная в Ruby). По порядку, подставляет искомый путь к каждой записи из массива
# и пытается найти файл. Если нигде нет — LoadError.
# require_relative производит поиск от текущей папки (файл из которой на данный момент исполняется, видимый в константе __FILE__;
# не путатьс рабочей папкой, которую можно получить с помощью File.expand_path ".").

require_relative "test"
require_relative "result_printer"
require_relative "filereader"

puts "Ваш уровень общительности. Тест поможет определить ваш уровень " \
  "коммуникабельности. Версия 0.2. (c) goodprogrammer.ru\n\n"

filereader = FileReader.new
test = Test.new(filereader.read_from_file("/data/questions.txt"))
result_printer = ResultPrinter.new(filereader.read_from_file("/data/answers.txt"))

test.do_test
  # Пока не все вопросы заданы, задем слебующий вопрос

# Вводим результаты теста методом print_result у объекта класса ResultPrinter
result_printer.print_res(test)

