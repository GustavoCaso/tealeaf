require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'pry'

set :sessions, true

helpers do
  def create_deck
    suit = ["clubs", "diamonds", "herts", "spades"]
    cards = %w( 2 3 4 5 6 7 8 9 10 jack queen king ace)
    deck = suit.product(cards)
  end

  def add_card(deck)
    deck.pop
  end
end

get '/' do
  haml :index
end

post '/bet' do
  session[:player] = params[:name]

  if session[:player].empty?
    flash[:error] = "You must tell use your name !!!"
    redirect "/"
  else
    haml :bet
  end
end

post '/start_game' do
  session[:bet] = params[:bet]
  session[:deck] = create_deck
  session[:player_cards] = []
  session[:player_cards] << add_card(session[:deck])
  session[:player_cards] << add_card(session[:deck])
  haml :start_game
end


