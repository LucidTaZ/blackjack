class Card

  FACE_NUMBER = "number"

  FACE_JACK = "jack"
  FACE_QUEEN = "queen"
  FACE_KING = "king"
  FACE_ACE = "ace"

  SUIT_HEARTS = "hearts"
  SUIT_DIAMONDS = "diamonds"
  SUIT_CLUBS = "clubs"
  SUIT_SPADES = "spades"
  SUITS = [SUIT_HEARTS, SUIT_DIAMONDS, SUIT_CLUBS, SUIT_SPADES]

  FACE_SHORTNAMES = {
    FACE_JACK => "J",
    FACE_QUEEN => "Q",
    FACE_KING => "K",
    FACE_ACE => "A"
  }

  SUIT_SHORTNAMES = {
    SUIT_HEARTS => "♥",
    SUIT_DIAMONDS => "♦",
    SUIT_CLUBS => "♣",
    SUIT_SPADES => "♠"
  }

  def initialize (face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end

  def value
    # Deciding whether an ace is 1 or 11 happens in the Player class
    @value
  end

  def short_name
    if @face == FACE_NUMBER
      "#{SUIT_SHORTNAMES[@suit]}#{value}"
    else
      "#{SUIT_SHORTNAMES[@suit]}#{FACE_SHORTNAMES[@face]}"
    end
  end

  def name
    if @face == FACE_NUMBER
      "#{value} of #{@suit}"
     else
      "#{@face} of #{@suit}"
    end
  end

  def ace?
    @face == FACE_ACE
  end
end
