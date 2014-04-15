# Lets Extraxt the nouns that are involved in a BlackJack game
# 1. Extract nouns
# 2. Think of behavior that noun could have
# 3. Create methods
# 4. Create SuperClases or Modules to extract comon behavior
############################################################################
# 1.The game start
# 2. Create a deck and shuffle
# 3. Ask for player name
# 4. Deal cards (one to the player and one to the dealer)
# 5. Evaluate cards and ask to hit or stay to the player
# 6. Repeat step 5. until player lose, stop or hit blackjack
# 7. Dealer turn
# 8. Repeat step 6.
<<-EOF
  So we could say Card, Deck, Player, Dealer
  Clases:
            Card:
                  1. Can tell us what card is.
            Deck:
                  1. Can shuffle
                  2. Deal card

            Player < Gamer


            Dealer < Gamer



  SuperClases:
            Gamer:
                  1.Introduce
                  2.Hit (That menas one more card from the deck)
                  2.Stay
  Module
            Hand:
                  1.Store the hand of the player
                  2.Evaluates cards and return value

EOF

module Handable



  def hand
    @hand ||= []
  end

  def hit(card)
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
    "Hey my name is #{name}"
  end
end


class Dealer < Gamer
  def to_s
    "Hey I'll be the dealer my name is #{name}"
  end
end

class Card

  attr_accessor :suit, :number

  def initialize (suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{suit} #{number}"
  end

end


class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    ["H", "S", "C", "D"].each do |suit|
      %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |number|
        @cards << Card.new(suit, number)
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
    @dealer = Player.new("Dealer")
    @deck = Deck.new
  end

  def run
    puts "Welcome to BlackJack OOP, lets keep it clean and enjoy the evening"
    puts "Welcome #{@player}"

  end


end


p = Player.new("Gustavo")
d = Deck.new
p.hit(d.deal)





