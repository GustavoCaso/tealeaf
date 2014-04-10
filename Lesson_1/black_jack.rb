require 'pry'


def say(str)
  puts str
end



def create_cards
  [1,2,3,4,5,6,7,8,9,10,11,12,13] * 4
end



def shuffle(arr)
  arr.sort_by{ rand }
end



def deal_cards(num, cards_shuffle)
  cards_shuffle.shift(num)
end

def dealer_turn(dealer_cards,cards_shuffle,player_hand)
  say "Ok so it's my turn know"
  dealer_hand,ace = evaluate_cards(dealer_cards)
  say "the dealer has #{dealer_hand}"
  if dealer_hand < player_hand
    dealer_cards << deal_cards(1, cards_shuffle).first
    dealer_turn(dealer_cards,cards_shuffle,player_hand)
  elsif (dealer_hand > player_hand || dealer_hand == player_hand) && dealer_hand < 21
    say "Dealer hand is #{dealer_hand} and your is #{player_hand} Dealer stay and wins"
    re_game
  elsif dealer_hand > 21
    say "Dealer hand is #{dealer_hand} Is way to high player wins"
    re_game
  elsif dealer_hand == 21
    say "The Dealer has BlackJack Dealer Wins"
    re_game
  end
end



def play(player_name,players_cards,cards_shuffle)
  player_hand, ace = evaluate_cards(players_cards)
  binding.pry
  if player_hand == 21
    say "You have blackJack You Win"
    say "Congratulations #{player_name}"
    re_game
  elsif player_hand > 21
    say "You have more that 21 I'm sorry but the house wins"
    say "Sorry #{player_name}"
    re_game
  else
    if ace
      say "#{player_name} you have an Ace and your game is #{player_hand} but it could be #{player_hand - 10} what do you want"
      choice = gets.chomp.to_i
      while choice != player_hand && choice != player_hand -10
        say "Don't try to cheat, be nice, so what would be your choice"
        choice = gets.chomp.to_i
      end
      player_hand = choice
      say "Ok so you have #{player_hand}, what do you want to do (hit or stay)"
      answer = gets.chomp.downcase
      while answer == "hit"
        players_cards << deal_cards(1, cards_shuffle).first
        play(player_name,players_cards, cards_shuffle)
      end
      dealer_cards = dealer_cards = deal_cards(2, cards_shuffle)
      dealer_turn(dealer_cards,cards_shuffle,player_hand)


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
end





def evaluate_cards(player_cards, game = 0)
  ace = false
  player_cards.each do |card|
    if card == 1
      ace = true
      game += 11
    elsif card > 10
      game += 10
    else
      game += card
    end
  end
  [game,ace]
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



def start_game
  cards = create_cards
  cards_shuffle = shuffle cards
  player_cards = deal_cards(2, cards_shuffle)
  say "What's your name"
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





say "Hy and welcome to the world best BlackJack ever. Do you want to play, I'm sure you want. First I'm going to shuffle the cards"


start_game



