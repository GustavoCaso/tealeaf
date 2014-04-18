require 'pry'

# Lets Extraxt the nouns that are involved in a BlackJack game
# 1. Extract nouns
# 2. Think of behavior that noun could have
# 3. Create methods
# 4. Create SuperClases or Modules to extract comon behavior
############################################################################
# 1.The game start
# 2. Create a deck and shuffle
# 3. Ask for player name (*Optional)
# 4. Deal cards (one to the player and one to the dealer)
# 5. Evaluate cards and ask to hit or stay to the player
# 6. Repeat step 5. until player lose, stop or hit blackjack
# 7. Dealer turn
# 8. Repeat step 6.
<<-EOF
  So we could say Card, Deck, Player, Dealer
  Clases:
            Deck:
                  1. Can shuffle
                  2. Deal card

            Player
                  include Hand

  Module
            Hand:
                  1.Store the hand of the player
                  2.Add card to the hand
                  3.Evaluates cards and return value

EOF



module Handable

  def add_card(card)
    hand << card
  end

  def evaluate_cards(hand)
    game = 0
    numbers = hand.map{|x| x.number}
    numbers.each do |number|
      if number == "A"
        game += 11
      elsif number.to_i == 0
        game += 10
      else
        game += number.to_i
      end
    end

    numbers.select{|x| x == "A"}.count.times do
      game -= 10 if game > 21
    end

    game
  end

  def show_hand
    hand.each do |card|
      puts "#{card}"
    end
  end

end


class Player

  include Handable

  attr_accessor :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def to_s
    "#{name}"
  end
end


class Card

  attr_accessor :suit, :number


  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{number} of #{which_suit}"
  end

  def which_suit
    ret_val = case suit
                when "C" then "Clubs"
                when "D" then "Diamonds"
                when "S" then "Spades"
                when "H" then "Hearts"
              end
    ret_val
  end

end

class Deck

  attr_accessor :cards

  def initialize(num_of_decks = 1)
    @cards = []

    ["H", "S", "C", "D"].each do |suit|
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |number|
        @cards << Card.new(suit , number)
      end
    end

    @cards * num_of_decks

    mix!
  end


  def mix!
    @cards.shuffle!
  end

  def deal
    cards.pop
  end

end


class Blackjack

  attr_accessor :player, :dealer, :deck, :player_game

  def initialize
    @player = Player.new("Gustavo")
    @dealer = Player.new("Christina")
    @deck = Deck.new
    @player_game = 0
  end

  def evaluate_game(hand)
    if hand == 21
      puts "You have blackjack Congratulations you win #{player} !!"
      re_game
    elsif hand > 21
      puts "You have more than 21 you lose #{player}. Sorry !!"
      re_game
    else
      puts "You have #{hand} what you want to do ? 1. for hit 2. for stay"
      answer = gets.chomp
      if answer == "1"
        hit
      else
        puts "Dealer turn"
        dealer_turn
      end
    end
  end

  def re_game
    puts "Would you like to play again ? 1.yes 2.no"
    if gets.chomp == "1"
      deck = Deck.new  # Reset Deck
      dealer.hand = [] # Reset dealer hand
      player.hand = [] # Reset player hand
      run
    else
      puts "See you later"
      exit
    end

  end

  def dealer_turn
    dealer_game = dealer.evaluate_cards(dealer.hand)
    if dealer_game < player_game
      dealer.add_card(deck.deal)
      dealer_turn
    elsif (dealer_game > player_game || dealer_game == player_game) && dealer_game < 21
      puts "Delaer wins he/she has better hand than yours"
      re_game
    elsif dealer_game > 21
      puts "#{dealer.name} lost this game dealer has #{dealer_game}"
      re_game
    elsif dealer_game == 21
      puts "#{dealer.name} made blackjack dealer wins"
      re_game
    end
  end

  def player_turn
    player_game = player.evaluate_cards(player.hand)
    evaluate_game(player_game)
  end

  def deal_cards
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
  end

  def hit
    player.add_card(deck.deal)
    player_game = player.evaluate_cards(player.hand)
    evaluate_game(player_game)
  end

  def set_player_name
    answer = gets.chomp
    player.name = answer
  end

  def run
    puts "Welcome to BlackJack OOP, lets keep it clean and enjoy the evening"
    puts "Whats your name ?"
    set_player_name
    puts "So lets start"
    puts "Dealing cards"
    deal_cards
    player_turn
  end




end

game = Blackjack.new
game.run

# p = Player.new("Gustavo")
# d = Deck.new
# p.add_card(d.deal)
# p.add_card(d.deal)

# puts p.hand



