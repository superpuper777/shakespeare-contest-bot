class QuizLogicModel < ApplicationRecord

  include ::BookConcern
  def determine_lvl(level)
       #level = 8
      case level
      when 1
        return search1
      when 2
        return search2
      when 3
        return search3
      when 4
        return search4
      when 5
        return search5
      when 6
        return search6
      when 7
        return search7
      when 8
        return asearch8
      else 'Invalid Level'
      end
  end

  def search1(question)
    answer = Answer.new
    return answer
  end

  def search2(question)
    answer = Answer.new
    return answer
  end

  def search3(question)
    answer = Answer.new
    return answer
  end

  def search4(question)
    answer = Answer.new
    return answer
  end

  def search5(question)
    answer = Answer.new
    return answer
  end

  def search6(question)
    answer = Answer.new
    return answer
  end

  def search7(question)
    answer = Answer.new
    return answer
  end

  def search8(question)
    answer = Answer.new
    return answer
  end

  def answer_thequest
    response =

end
