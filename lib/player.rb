class Player
  def initialize(name)
    @holding = []
    @name = name
  end

  def begin_turn (deck)
    draw deck
    draw deck
  end

  def new_round(deck)
    deck.add_to_discards(@holding)
    @holding = []
    draw deck
    draw deck
  end

  def draw (deck)
    @holding.push deck.draw
  end

  def hand_value
    value = @holding.map{|card|card.value}.reduce(0, :+)
    n_aces = @holding.select{|card|card.ace?}.count
    while value < 10 && n_aces > 0 do
      value += 10
      n_aces -= 1;
    end
    value
  end

  def alive?
    hand_value <= 21
  end

  def hand_to_string
    @holding.map{|card|card.short_name}.join(", ")
  end

  def name
    @name
  end
end