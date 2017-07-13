class Test
  attr_reader :yes_answer, :no_answer, :sometimes_answer

  def initialize(questions)
    @questions = questions
    # Общие набраные очки
    @total_points = 0
    # Текущий воппрос
    @current_question = 0
    # Ответов да
    @yes_answer = 0
    # Ответов нет
    @no_answer = 0
    # Ответов иногда
    @sometimes_answer = 0
  end

  def do_test
    until @current_question >= @questions.size
      next_question
    end
  end

  def input
    user_input = nil
    while user_input != "да" && user_input != "нет" && user_input != "иногда"
      puts "Введите да нет или иногда"
      user_input = STDIN.gets.encode("UTF-8").chomp.downcase
    end
    check_input(user_input)
  end

  def check_input(user_input)
    if user_input == "да"
      @total_points += 2
      @yes_answer += 1
    elsif user_input == "иногда"
      @total_points += 1
      @sometimes_answer += 1
    else
      @no_answer += 1
    end
  end

  def next_question
    puts @questions[@current_question]
    input
    @current_question += 1
  end

  def check_result
    return 0 if @total_points.between?(30,32)
    return 1 if @total_points.between?(25,29)
    return 2 if @total_points.between?(19,24)
    return 3 if @total_points.between?(14,18)
    return 4 if @total_points.between?(9,13)
    return 5 if @total_points.between?(4,8)
           6 if @total_points.between?(0,3)
  end
end
