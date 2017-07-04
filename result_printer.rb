class ResultPrinter
  def initialize(answers)
    @answers = answers
  end

  def print_res(test)
    puts "\n Ваш результат теста (ответов да - #{test.yes_answer},ответов нет - #{test.no_answer},ответов иногда - #{test.sometimes_answer})"
    puts @answers[test.check_result]
  end
end
