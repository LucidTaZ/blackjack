require_relative "deck.rb"
require_relative "human.rb"
require_relative "dealer.rb"

class Game
  def initialize
    @deck = Deck.new
    @players = [Human.new("Thijs"), Human.new("Martina")]
    @dealer = Dealer.new
  end

  def play
    while true do
      round
    end
  end

  def round
    new_round
    alive_players = turn_players
    if !alive_players.empty?
      turn_player @dealer
      if @dealer.alive?
        alive_players.each{|player|
          player.give_score 1 if player.hand_value == @dealer.hand_value
          player.give_score 3 if player.hand_value > @dealer.hand_value
        }
      else
        # The dealer went bust, assign scores to alive_players
        alive_players.each{|player|player.give_score 3}
      end
    end
    @players.each{|player|puts "#{player.name} score: #{player.score}"}
    puts
  end

  def turn_players
    alive_players = @players.clone
    alive_players
      .each{|player|turn_player player}
      .select{|player|player.alive?}
  end

  def turn_player(player)
    output_hand player
    begin
      turn_done = turn_step player
    end until turn_done
    turn_done
  end

  def turn_step(player)
    # returns whether the turn is terminated
    turn_done = false
    if player.decide
      player.draw @deck
      output_hand player
      turn_done = true if !player.alive?
    else
      turn_done = true # Player did not want a new card
    end
  end

  def new_round
    @players.each{|player|player.new_round @deck}
    @dealer.new_round @deck
    # Reveal the hands so players can base decisions on that
    @players.each{|player|puts "#{player.name}: #{player.hand_to_string}"}
    puts "#{@dealer.name}: #{@dealer.peek.short_name} ??"
  end

  def output_hand(player)
    puts "#{player.name}: [#{player.hand_value.to_s.rjust(2)}] #{player.hand_to_string}"
  end
end