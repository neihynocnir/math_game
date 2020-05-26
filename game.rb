require_relative './player.rb'
require_relative './question.rb'

class Game

  def initialize
    @player_one = Player.new("Player 1")
    @player_two = Player.new("Player 2")
    @ctive = @player_one 
  end

  def player_turn
    if @ctive == @player_one
      @ctive = @player_two
    else
      @ctive = @player_one
    end
  end

  def play
    puts "Let's play"
    while @ctive.lives > 0
      @question = Question.new
      puts "\n------ NEW TURN ------ \n"
      puts "#{@ctive.name} turn"
      puts "#{@question.quest}"
      player_answer = $stdin.gets.chomp.to_i
    
      if @question.check(player_answer)
        puts "YES! You are correct."
      else
        puts "Seriously?, No!"
        @ctive.losing 
      end

      if @ctive.lives > 0
        puts "\nP1: #{@player_one.lives}/3 vs P2: #{@player_two.lives}/3"
        player_turn
      else 
        puts "\n------ GAME OVER ------ \n#{@ctive.name} lost! \nGood bye!"
      end
    end
  end
end
