require 'io/console'

require_relative "player.rb"

class Human < Player
  def initialize (name)
    super(name)
    @score = 0
  end

  def decide
    begin
      puts "#{name} card? (y/n/q)"
      answer = STDIN.getch.chomp
    end until ["y", "n", "q"].include? answer
    exit if answer == "q"
    answer == "y"
  end

  def give_score(score)
    @score += score
  end

  def score
    @score
  end
end