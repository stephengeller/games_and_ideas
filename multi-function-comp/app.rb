require 'sinatra/base'
require './lib/guess'
require './lib/pickanumber'
require './lib/player.rb'

class GuessingGame < Sinatra::Base
  enable :sessions
  set :bind, '192.168.1.111'

  get '/' do
    session[:score] = 0
    erb(:index)
  end

  post '/name' do
    session[:player] = Player.new(params[:Player])
    redirect '/play'
  end

  get '/play' do
    @player = session[:player]
    @game = Guesser.new
    @game.randomise
    session[:game] = @game
    erb(:play)
  end

  post '/higher' do
    @player = session[:player]
    @game = session[:game]
    @game.too_low
    session[:game] = @game
    erb(:play)
  end

  post '/lower' do
    @player = session[:player]
    @game = session[:game]
    @game.too_high
    session[:game] = @game
    erb(:play)
  end

  post '/equal' do
    erb(:equal)
  end

  run! if app_file == $PROGRAM_NAME
end
