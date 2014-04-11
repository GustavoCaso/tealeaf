require 'pry'


def say(str)
  puts str
end


def create_deck
  suits = %w( A H D C )
  cards = %w( 2 3 4 5 6 7 8 9 10 J Q K A)
  deck = suits.product(cards)
end



def shuffle_deck(arr)
  arr.sort_by{ rand }
end


def deal_cards(num, cards_shuffle)
  cards_shuffle.shift(num)
end

def start_game
  cards = create_deck
  cards_shuffle = shuffle_deck(cards)
  player_cards = deal_cards(2, cards_shuffle)
  say "While I prepare the deck lets have a little talk, What's your name"
  player_name = gets.chomp
  say "Are you ready to start? (yes or no)"
  answer = gets.chomp.downcase
  if answer == "yes"
    play(player_name, player_cards, cards_shuffle)
  else
    say "really I will ask you until you say yes #{player}"
    start_game(player ,player_cards, cards_shuffle)
  end
end

def play(player_name,players_cards,cards_shuffle)
  player_hand = evaluate_cards(players_cards)

  if player_hand == 21
    say "BlackJack congratulations you WIN !!!!!!!!. This are your cards #{players_cards.to_s}"
    re_game
  elsif player_hand > 21
    say "You have more that 21 I'm sorry but the house wins. This are your cards #{players_cards.to_s}"
    say "Sorry #{player_name}"
    re_game
  else
    say "#{player_name} your hand is #{player_hand} what you want to do? (hit or stay)"
    answer = gets.chomp.downcase
    while answer == "hit"
      players_cards << deal_cards(1, cards_shuffle).first
      play(player_name,players_cards, cards_shuffle)
    end
    dealer_cards = dealer_cards = deal_cards(2, cards_shuffle)
    dealer_turn(dealer_cards,cards_shuffle,player_hand)
  end
end



def evaluate_cards(cards)
  game = 0
  values = cards.map{|card| card[1]}
  values.each do |value|
    if value == "A"
      ace = true
      game += 11
    elsif value.to_i == 0
      game += 10
    else
      game += value.to_i
    end
  end

  values.select{|x| x == "A"}.count.times do
    game -= 10 if game > 21
  end

  game
end

def dealer_turn(dealer_cards,cards_shuffle,player_hand)
  say "Ok so it's my turn know"
  dealer_hand,ace = evaluate_cards(dealer_cards)
  say "the dealer has #{dealer_hand}"
  if dealer_hand < player_hand
    dealer_cards << deal_cards(1, cards_shuffle).first
    dealer_turn(dealer_cards,cards_shuffle,player_hand)
  elsif (dealer_hand > player_hand || dealer_hand == player_hand) && dealer_hand < 21
    say "Dealer hand is #{dealer_hand} and your is #{player_hand}. Dealer stay and wins"
    re_game
  elsif dealer_hand > 21
    say "Dealer hand is #{dealer_hand} Is way to high player wins. This are the dealers cards #{dealer_cards.to_s}"
    re_game
  elsif dealer_hand == 21
    say "The Dealer has BlackJack Dealer Wins. This are the dealers cards #{dealer_cards.to_s}"
    re_game
  end
end


def re_game
  say "Would you like to play again ?"
  answer = gets.chomp.downcase
  if answer == "yes"
    start_game
  else
    say "It's been great hope to see you later"
    exit
  end
end




say "Hy and welcome to the world best BlackJack ever."


start_game



