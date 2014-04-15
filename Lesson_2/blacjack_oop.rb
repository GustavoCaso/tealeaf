# Lets Extraxt the nouns that are involved in a BlackJack game
# 1. Extract nouns
# 2. Think of behavior that noun could have

############################################################################
<<-EOF
  So we could say Card, Deck, Player, Dealer
  Behavior:
            Card:
                  1. Can tell us what card is.
            Deck:
                  1. Can shuffle
                  2. Deal card
            Player:
                  1. Introduce
                  2. Game.hit
                  3. Game.stay

            Dealer:
                  1. Introduce
                  2. Deal card(Deck)
                  (3. Calculate total value of card)
                  4. Game.hit
                  5. Game.stay
  Modules:
            Game:
                  1.Hit
                  2.Stay

EOF


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


class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "Hi my name is #{name}"
  end

  def hit

  end

  def stay

  end

end


class Dealer

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "Hi I will be your dealer tonight my name is #{name}"
  end

  def hit

  end

  def stay

  end

  def deal_card

  end

  def evaluate_cards

  end

end



d = Deck.new
puts d.cards