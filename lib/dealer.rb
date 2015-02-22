require_relative "player.rb"

class Dealer < Player
  def initialize
    super("Dealer")
  end

  def decide
    # TODO: The bank can also stop when the score is higher than the player's score
    return hand_value < 17
  end

  def peek
    # See one of the Dealer's cards
    return @holding[0]
  end
end