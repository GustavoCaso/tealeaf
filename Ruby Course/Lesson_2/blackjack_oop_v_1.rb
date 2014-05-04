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

            Player < Gamer


  SuperClases:
            Gamer:
                  1.Introduce
                  2.Hit (That menas one more card from the deck)
                  2.Stay
  Module
            Hand:
                  1.Store the hand of the player
                  2.Add card to the hand
                  3.Evaluates cards and return value

EOF



module Handable

  attr_accessor :hand

  def hand
   @hand ||= []
  end


  def add_card(card)
    hand << card
  end

  def evaluate_cards(hand)
    game = 0

    numbers = hand.map{|x| x[1]}
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

end


class Gamer

  include Handable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

class Player < Gamer
  def to_s
    "#{@name}"
  end
end


class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    ["H", "S", "C", "D"].each do |suit|
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |number|
        @cards << [suit,number]
      end
    end
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

  def initialize
    @player = Player.new("Gustavo")
    @dealer = Player.new("Christina")
    @deck = Deck.new
    @player_game = 0
  end

  def evaluate_game(game)
    if game == 21
      puts "You have blackjack Congratulations you win #{@player} nice hand by the way #{@player.hand}"
    elsif game > 21
      puts "You have more than 21 you lose #{@player} this are your cards #{@player.hand}"
    else
      puts "You have #{game} what you want to do ? 1. for hit 2. for stay"
      answer = gets.chomp
      if answer == "1"
        hit
      else
        puts "Dealer turn"
        dealer_turn
      end
    end
  end

  def dealer_turn
    dealer_game = @dealer.evaluate_cards(@dealer.hand)
    if dealer_game < @player_game
      @dealer.add_card(@deck.deal)
      dealer_turn
    elsif (dealer_game > @player_game || dealer_game == @player_game) && dealer_game < 21
      puts "Delaer wins he/she has better hand than yours #{@dealer.hand}"
    elsif dealer_game > 21
      puts "#{@dealer.name} lost this game dealer has #{dealer_game} and his cards where #{@dealer.hand}"
    elsif dealer_game == 21
      puts "#{@dealer.name} made blackjack dealer wins and his cards where #{@dealer.hand}"
    end
  end

  def hit
    @player.add_card(@deck.deal)
    @player_game = @player.evaluate_cards(@player.hand)
    evaluate_game(@player_game)
  end

  def run
    puts "Welcome to BlackJack OOP, lets keep it clean and enjoy the evening"
    puts "Welcome #{@player}"
    puts "So lets start"
    puts "Dealing cards"
    @player.add_card(@deck.deal)
    @dealer.add_card(@deck.deal)
    @player.add_card(@deck.deal)
    @dealer.add_card(@deck.deal)
    @player_game = @player.evaluate_cards(@player.hand)
    evaluate_game(@player_game)
  end


end

game = Blackjack.new
game.run


