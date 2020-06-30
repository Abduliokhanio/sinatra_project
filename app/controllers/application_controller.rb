require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "f650ed69344bab0084199bb8cc9aa5a1bd6756c3b57ad67023255af0fc3795057e"
  end

  get "/" do
    redirect '/login'
  end

  helpers do 
    def logged_in?
      !!session[:User_id]
    end 

    def login_user(obj)
      session[:User_id] = obj.id
    end 

    def current_user
      @user ||= Employee.find_by_id(session[:User_id]) if logged_in?
    end 

    def error_setter_ticket(obj)
      flash[:title_error] = obj.errors.messages[:title]
      flash[:details_error] = obj.errors.messages[:details]
    end 

    def error_getter_ticket
      @error_title = flash[:title_error]
      @error_details = flash[:details_error]
    end 

    def error_setter_signup(obj)
      flash[:name_error] = obj.errors.messages[:name]
      flash[:username_error] = obj.errors.messages[:username]
      flash[:password_error] = obj.errors.messages[:password]
    end

    def error_getter_signup
      @name_error = flash[:name_error]
      @username_error = flash[:username_error]
      @password_error = flash[:password_error]
    end

  end 

end
