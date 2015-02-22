require_relative "card.rb"

class Deck
  def initialize
    @contents = []
    @discards = []
    reset
  end

  def reset
    for suit in Card::SUITS
      for value in 2..10
        @contents.push Card.new(Card::FACE_NUMBER, suit, value)
      end
      @contents.push Card.new(Card::FACE_JACK, suit, 10)
      @contents.push Card.new(Card::FACE_QUEEN, suit, 10)
      @contents.push Card.new(Card::FACE_KING, suit, 10)
      @contents.push Card.new(Card::FACE_ACE, suit, 1)
    end
    @contents.shuffle!
  end

  def add_to_discards(cards)
    @discards.concat cards
  end

  def draw
    @contents.concat @discards.shuffle
    @discards = []
    @contents.shift
  end

  def empty?
    @contents.empty?
  end
end