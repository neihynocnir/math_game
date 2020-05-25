class Question

  attr_accessor :nswer

  def initialize
    @number_one = rand(1..20)
    @number_two = rand(1..20)
    @nswer = @number_one + @number_two
  end

  def quest
    puts "What does #{@number_one} plus #{@number_two}?"
  end

   def check(player_answer)
    player_answer == @nswer
  end

end
