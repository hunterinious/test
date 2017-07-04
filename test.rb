class Test
  def initialize(questions)
    @questions = questions
    #Общие набраные очки
    @total_points = 0
    #Текущий воппрос
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

  def next_question
     puts @questions[@current_question]
     user_input = nil

    while user_input != "да" && user_input != "нет" && user_input != "иногда"
      puts "Введите да нет или иногда"
      user_input = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    if user_input == "да"
      @total_points += 2
      @yes_answer += 1
    elsif user_input == "иногда"
      @total_points += 1
      @sometimes_answer += 1
    else
      @no_answer += 1
    end

    @current_question += 1
  end

  def check_result
     if @total_points.between?(30,32)
      0
    elsif @total_points.between?(25,29)
      1
    elsif @total_points.between?(19,24)
      2
    elsif @total_points.between?(14,18)
      3
    elsif @total_points.between?(9,13)
      4
    elsif @total_points.between?(4,8)
      5
    else
      6
    end
  end

  def total_points
    @total_points
  end

  def yes_answer
    @yes_answer
  end

  def no_answer
    @no_answer
  end

  def sometimes_answer
    @sometimes_answer
  end
end
