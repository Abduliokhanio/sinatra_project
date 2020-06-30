class LoginController < ApplicationController
    use Rack::Flash

    get "/login" do 
        @login_error = flash[:login_error]
        erb :'sessions/login'
    end

    post '/login' do 
        user = Employee.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:User_id] = user.id
            redirect "/tickets"
        else 
            flash[:login_error] = "Please enter the correct username or password"
            redirect '/login'
        end 
    end 

    get '/logout' do 
        session.clear
        redirect '/login'
    end 

    get "/signup" do 
        @name_error = flash[:name_error]
        @username_error = flash[:username_error]
        @password_error = flash[:password_error]
        erb :'users/signup'
    end 

    post "/signup" do 
        user = Employee.new(params)
        if user.save
            session[:User_id] = user.id
            redirect "/tickets"
        else
            flash[:name_error] = user.errors.messages[:name]
            flash[:username_error] = user.errors.messages[:username]
            flash[:password_error] = user.errors.messages[:password]
            redirect "/signup"
        end 
    end 
end 