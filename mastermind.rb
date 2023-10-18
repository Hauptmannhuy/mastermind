
class Game
  attr_reader :code
  def self.start
    puts "Welcome to Mastermind!"
    puts "There should be documentation"
    puts "Press 1 you want to play as breaker, or press 2 you want to play as maker otherwise"
    input = gets.chomp
    new_game = Game.new
    if input == '1'
      new_game.initialize_breaker
    else
      new_game.initialize_maker
    end
  end

def get_input
  puts "Type 4 digits from 1 to 6. Your input shouldn't be greater than 4"
  input = gets.chomp
  is_number = input.to_i
  while is_number == 0 || input.size != 4 || input.each_char.any?{|el| el.to_i > 6} do
    if is_number == 0
      puts "Your input should be only numeric!"
    elsif input.size != 4
      puts "Your input should be exactly 4 digits!"
    else 
      puts "Numbers shouldn't be greater than 6!"
    end
    input = gets.chomp
    is_number = input.to_i
  end
  input.split('').map{|el| el.to_i}
end


def initialize_maker
  @code = get_input()
  puts "#{@code}"
  play_maker()
end

def initialize_breaker
  @code = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
  puts "#{@code}"
  play_breaker()
end

def play_breaker
  attempts = 0
  while attempts < 12 do
    code = @code.dup
    tracking_guess = [nil,nil,nil,nil]
    bulls = 0
    cows = 0
    player_guess = get_input()
    code.each_with_index do |el, index|
      if player_guess[index] == el
        code[index] = 'bull'
        tracking_guess[index] = 'bull'
      end
    end
      code.each_with_index do |el,index|
      if  player_guess[index] != el && code.include?(player_guess[index]) && el != 'bull'
        tracking_guess[index] = 'cow'
      end
    end
    tracking_guess.each do |el|
      if el == 'bull'
        bulls+=1
      elsif el == 'cow'
        cows+=1
      end
    end
    puts "bulls:#{bulls} cows #{cows}"
    puts "#{code}"
   if bulls == 4
    puts "You win!"
    break
   end
    attempts+=1
  end
  if bulls != 4 
    puts "You lost!"
  end
end

def play_maker

  end
end


Game.start
