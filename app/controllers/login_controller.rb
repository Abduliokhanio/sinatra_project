class LoginController < ApplicationController

    get "/login" do 
        erb :'sessions/login'
    end

    post '/login' do 
        user = Employee.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            session[:User_id] = user.id
            redirect "/tickets"
        else 
            redirect '/login'
        end 
    end 

    get '/logout' do 
        session.clear
        redirect '/login'
    end 

    get "/signup" do 
        erb :'users/signup'
    end 

    post "/signup" do 
        binding.pry
        user = Employee.create(params)
        if user.save
            redirect "/tickets"
        else
            redirect "/signup"
        end 
    end 


end 