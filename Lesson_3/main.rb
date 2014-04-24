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

  def evaluate_game(game)
    if game == 21
      "The player has blackJack congratulations"
    elsif game > 21
      "The player is busted with #{game}"
    else
      "What would you like to do"
    end
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
  session[:player_total] = calculate_total(session[:player_cards])
  haml :start_game
end


