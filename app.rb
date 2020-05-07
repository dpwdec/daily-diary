require 'sinatra'
require './lib/diary_entry'
require './lib/diary'

class DiaryApp < Sinatra::Base

  enable :sessions

  get '/' do
    'hello world'
  end

  get '/entries' do
    @entries = Diary.entries
    erb(:entries)
  end

  get '/add-entry' do
    erb(:add_entry)
  end

  post '/add-entry' do
    Diary.add_entry(params[:title], params[:body])
    redirect('/entries')
  end
end
