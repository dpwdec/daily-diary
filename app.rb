require 'sinatra'

class DiaryApp < Sinatra::Base

  enable :sessions

  get '/' do
    'hello world'
  end

  get '/entries' do
    @entries = Diary.entries
    erb(:index)
  end

  get '/add-entry' do
    erb(:add_entry)
  end

  post '/add-entry' do
    Diary.add_entry(params[:title], params[:body])
    redirect('/entries')
  end
end
