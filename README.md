# Blackjack

## Introduction

In this simple version of Blackjack, one player competes with the dealer (computer).
The game is played with a deck of cards in multiple rounds. Each round the player loses, wins or draws.
A score is maintained through the rounds.

## Rules

- The player starts each round with 2 random cards from the deck
- The dealer starts each round with 2 random cards, of which one is visible to the player
- The player chooses 'deal' to receive 1 more random card from the deck as many times as she wants
- If at any time the players hand value exceeds 21 points, she immediately loses the game
- The player chooses to 'pass' to end her turn
- The dealer then chooses to be dealt cards as long as his hand value is under 17 points, then passes
- If at any time the dealers hand value exceeds 21 points, the player immediately wins the game
- When the dealer passes, he reveals his hand. The outcome is decided
- Any earned points are added to the players score, then a new round is started

## Values

The deck consists of a standard 52 playing-cards deck, without jokers (2-10, J, Q, K, A in the 4 suits)

Each card has a point value as follows:
- 2-10: their face value in points
- J, Q, K: 10 points
- A: 1 point

Outcome of the game is decided as follows:
- The dealer has more points: Player loses (0 points)
- The player has more points: Player wins (3 points)
- The score is a tie: Player draws (1 point)

## Extra's
The following extra rules are optional challenges:
- The Ace has a value of 1 OR 11 points.
  - The choice is to the player, but in practice you can deduce the desired value based on total points in hand.
  - The dealer always counts an Ace as 1 point
- The game can be played by up to 8 players, taking turns in sequence.
  - Following the outcome rules, multiple players can 'win' a round.
  - The winner of the game is the player with the most points after X rounds.
  - Create an interface to add players and set their names.
  - Create a scoreboard to keep track of player scores.
- The player can bet on a good opening hand.
  - At the start of the round, after seeing the 2 cards, the player may opt to 'double down'
  - The player gets exactly one card after this choice, then her turn ends.
  - If the player wins after doubling down, she earns 6 points in stead of 3
  - If the player loses after doubling down, she loses 3 points in stead of gaining 0 (this can result in a negative score)
