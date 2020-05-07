require 'sinatra'

class DiaryApp < Sinatra::Base

  enable :sessions

  get '/' do
    'hello world'
  end

  get '/entries' do
    @title = session[:title]
    @entry = session[:body]
    erb(:index)
  end

  get '/add-entry' do
    erb(:add_entry)
  end

  post '/add-entry' do
    session[:title] = params[:title]
    session[:body] = params[:body]
    redirect('/entries')
  end
end
