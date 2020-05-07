require 'sinatra'

class DiaryApp < Sinatra::Base

  enable :sessions

  get '/' do
    @entry = session[:body]
    erb(:index)
  end

  get '/add-entry' do
    erb(:add_entry)
  end

  post '/add-entry' do
    session[:body] = params[:body]
    redirect('/')
  end
end
