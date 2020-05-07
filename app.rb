require 'sinatra'
require './lib/diary_entry'
require './lib/diary'

class DiaryApp < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions

  get '/' do
    'hello world'
  end

  get '/entries' do
    @entries = Diary.entries
    erb(:entries)
  end

  patch '/entries' do
    Diary.update_entry(params[:id], params[:title], params[:body])
    redirect('/entries')
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

  get '/entry/:id/edit' do
    @entry = Diary.get_entry(params[:id])
    erb(:edit_entry)
  end
end
