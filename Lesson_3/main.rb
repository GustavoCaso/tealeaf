require 'rubygems'
require 'sinatra'
require 'pry'

set :sessions, true

BLACKJACK_AMOUNT = 21
DEALER_MIN_HIT = 17

helpers do
  def show_cards(cards, cover = true)
    src = []
    cards.each { |card| src << "images/cards/#{card.join('_')}.jpg" }
    src[0] = "images/cards/cover.jpg" unless cover
    src
  end

  def create_deck
    suit = ["clubs", "diamonds", "hearts", "spades"]
    cards = %w( 2 3 4 5 6 7 8 9 10 jack queen king ace)
    deck = suit.product(cards)
    deck.shuffle!
  end

  def add_card(deck)
    deck.pop
  end

  def start_game
    session[:deck] = create_deck
    session[:player_cards] = []
    session[:dealer_cards] = []
    session[:player_cards] << add_card(session[:deck])
    session[:dealer_cards] << add_card(session[:deck])
    session[:player_cards] << add_card(session[:deck])
    session[:dealer_cards] << add_card(session[:deck])
    session[:player_total] = calculate_total(session[:player_cards])
    session[:dealer_total] = calculate_total(session[:dealer_cards])
  end

  def calculate_total(cards)
    total = 0
    number = cards.map{|card| card[1]}

    number.each do |n|
      if n == "ace"
        total += 11
      else
        n.to_i == 0 ? total += 10 : total += n.to_i
      end
    end

    number.select{ |n| n == "ace"}.count.times do
      total -= 10 if total > BLACKJACK_AMOUNT
    end
    total
  end

  def hit
    session[:player_cards] << add_card(session[:deck])
    session[:player_total] = calculate_total(session[:player_cards])
  end

  def dealer_hit
    session[:dealer_cards] << add_card(session[:deck])
    session[:dealer_total] = calculate_total(session[:dealer_cards])
  end

  def winner!(msg)
    @new_game = true
    session[:total_money] += session[:bet]
    @success = "#{msg}"
  end

  def loses!(msg)
    @new_game = true
    session[:total_money] -= session[:bet]
    @error = "#{msg}"
  end


  def check_player_total
    if session[:player_total] == BLACKJACK_AMOUNT
      winner!("Congratulations #{session[:player]} you hit 21 BlackJack")
      haml :start_game
    elsif session[:player_total] > BLACKJACK_AMOUNT
      loses!("Sorry #{session[:player]} you busted with #{session[:player_total]}")
      haml :start_game
    else
      haml :start_game
    end
  end

  def check_dealer_total
    if session[:dealer_total] == session[:player_total]
      loses!("Sorry its a tie , that means Dealer wins")
      haml :start_game
    elsif session[:dealer_total] < DEALER_MIN_HIT
      @dealer_hit = true
      haml :start_game
    elsif session[:dealer_total] == BLACKJACK_AMOUNT
      loses!("Sorry dealer has Blackjack sorry #{session[:player]} you lose")
      haml :start_game
    elsif session[:dealer_total] > BLACKJACK_AMOUNT
      winner!("Dealer busted with #{session[:dealer_total]}, that means  #{session[:player]} wins")
      haml :start_game
    end
  end


end

#ROUTES

get '/' do
  session[:total_money] = 500
  haml :index
end

post '/new_game' do
  session[:player] = params[:name]
  if session[:player].empty?
    @error = "You must tell use your name !!!"
    haml :index
  else
    haml :bet
  end
end

get '/new_game' do
  haml :bet
end

post '/start_game' do
  session[:dealer_turn] = false
  session[:bet] = params[:bet].to_i
  start_game
  check_player_total
end

post '/hit' do
  hit
  check_player_total
end

get '/bet' do
  redirect '/new_game'
end


post '/stay' do
  session[:dealer_turn] = true
  check_dealer_total
end

get '/dealer_hit' do
  dealer_hit
  check_dealer_total
end

get '/game_over' do
  haml :game_over
end


