class Game 
  def self.start
    puts "Welcome to Mastermind!"
    puts "There should be documentation"
    puts "Press 1 you want to play as breaker, or press 2 you want to play as maker otherwise"
    input = gets.chomp
    mode_selection(input)
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
  input
end

def initialize_breaker
  @code = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]

end

def initialize_maker
  @code = get_input()

end

breaker = nil
maker = nil

end

Game.start