class Game
  @@suits = {
    hearts: 9829.chr('utf-8'),
    spades: 9824.chr('utf-8'),
    diamonds: 9830.chr('utf-8'),
    clubs: 9827.chr('utf-8')
  }
  @@cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize
    @deck = []
    @@suits.each do |suit, symbol|
      @@cards.each do |card|
        @deck.push(Card.new card, symbol)
      end
    end
  end

  def cards_in_deck
    @deck.count
  end

  def deal player, ammount
    ammount.times.collect do
      player.add_to_hand @deck.shuffle!.pop
    end
  end

end

class Player
  def initialize name
    @name = name
    @score = 0
    @hand = []
    puts "welcome #{@name}!"
  end

  def add_to_hand card
    @hand.push card
  end

  def show_hand
    puts @hand.join(' ') + " (#{hand_value} points)"
  end

  def hand_value
    @hand.inject(0) { |result, element| result + element.value }
  end

end

class Card
  attr_accessor :name, :face, :suit, :value
  def initialize face, suit
    @face = face
    @suit = suit
    @value = set_value
    @name = suit + face
  end

  def set_value
    if @face == "A"
      value = 1
    elsif @face.to_i == 0  #all non-numeric except the A(ce)
      value = 10
    else
      value = @face.to_i
    end
  end

  def to_s
    '[' + @name + ']'
  end
end

@game = Game.new
@player = Player.new 'Rik'

@game.deal @player, 2
puts 'Your starting hand is:'
@player.show_hand
