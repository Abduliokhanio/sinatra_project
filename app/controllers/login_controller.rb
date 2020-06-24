class LoginController < ApplicationController

    get "/login" do 
        erb :'sessions/login'
    end

    post '/login' do 
        @user = Employee.find_by(username: params[:username])
        redirect "/tickets"
    end 

    get "/signup" do 
        erb :'users/signup'
    end 

    post "/signup" do 
        @user = Employee.create(name: params[:name], username: params[:username], password: params[:password])
        redirect "/tickets"
    end 


end 