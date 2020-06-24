class LoginController < ApplicationController

    get "/login" do 
        erb :'sessions/login'
    end

    post '/login' do 
        @user = Employee.find_by(username: params[:username])
        erb :'tickets/all_tickets'
    end 

    get "/signup" do 
        erb :'sessions/signup'
    end 

    post "/signup" do 
        #@user = Employee.create()#psudo bs code
    end 


end 