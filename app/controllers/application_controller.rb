require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "f650ed69344bab0084199bb8cc9aa5a1bd6756c3b57ad67023255af0fc3795057e"
  end

  get "/" do
    erb :'welcome'
  end

  helpers do 
    def logged_in?
      !!session[:User_id]
    end 

    def current_user
      @user ||= Employee.find_by_id(session[:User_id]) if logged_in?
    end 
  end 

end
