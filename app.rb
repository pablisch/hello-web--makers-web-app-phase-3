require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # get '/' do
  #   "Some response data"
  # end

  get '/home' do
    # The code here is executed when a request is received and we need to 
    # send a response. 

    # We can return a string which will be used as the response content.
    # Unless specified, the response status code will be 200 (OK).
    return 'Some response data'
  end

  post '/home' do
    return 'Some response data'
  end

  get '/help' do
    name = params[:name]
    return "Hello #{name}!"
  end

  post '/help' do
    return "Hello World!"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
    return "Hello #{name}"
  end

  get '/names' do
    names = params[:names]
    return names.split(",").join(", ")
  end

  post '/sort-names' do
    names = params[:names]
    return names.split(",").sort.join(",")
  end

  get '/hello' do
    return erb(:hello)
  end

  get '/' do
    @name = params[:name]
    return erb(:index)
  end

  get '/my_test' do
    @greeting = params[:greeting]
    @addressing = params[:addressing]
    @name1 = params[:name1]
    @name2 = params[:name2]
    @name3 = params[:name3]
    @place = params[:place]
    return erb(:my_test)
  end


end

