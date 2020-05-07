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

  get '/entry/:id' do
    @entry = Diary.get_entry(params[:id])
    erb(:entry)
  end
end
