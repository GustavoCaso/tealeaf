require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'pry'

set :sessions, true

helpers do

  def h(text)
    Rack::Utils.escape_html(text)
  end

  def show_cards(cards)
    url = []
    cards.each do |card|
      image_name = card.join('_')
      url << "images/cards/#{image_name}.jpg"
    end
    url
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
    number = []
    cards.each do |card|
      number << card[1]
    end

    number.each do |n|
      if n == "ace"
        total += 11
      elsif n.to_i == 0
        total += 10
      else
        total += n.to_i
      end
    end

    number.select{ |n| n == "ace"}.count.times do
      total -= 10 if total > 21
    end
    total
  end

  def hit
    session[:player_cards] << add_card(session[:deck])
    session[:player_total] = calculate_total(session[:player_cards])
  end


end

get '/' do
  haml :index
end

post '/new_game' do
  session[:player] = params[:name]

  if session[:player].empty?
    flash[:error] = "You must tell use your name !!!"
    redirect "/"
  else
    haml :bet
  end
end

get '/new_game' do
  haml :bet
end

post '/start_game' do
  session[:bet] = params[:bet]
  start_game
  binding.pry
  haml :start_game
end

get '/start_game' do
  haml :start_game
end

post '/hit' do
  hit
  if session[:player_total] == 21
    flash[:success  ] = "Congratulations #{session[:player]} you hit 21 BlackJack"
    redirect '/start_game'
  elsif session[:player_total] > 21
    flash[:error] = "Sorry #{session[:player]} you busted with #{session[:player_total]}"
    redirect '/start_game'
  else
    redirect '/start_game'
  end
end

get '/bet' do
  redirect '/new_game'
end


post '/stay' do
  @dealer_turn = true
  if session[:dealer_total] == session[:player_total]
    flash[:error] = "Sorry the dealer has the same game so you lose"
    redirect '/start_game'
  elsif session[:dealer_total] < 17
    @dealer_hit = true
    redirect '/start_game'
  elsif session[:dealer_total] == 21
    flash[:error] = "Sorry dealer has Blackjack soory #{session[:player]} you lose"
    redirect '/start_game'
  else
    flash[:success] = "Dealer busted that means #{session[:player]} wins"
    redirect '/start_game'
  end
end

get '/game_over' do
  haml :game_over
end


