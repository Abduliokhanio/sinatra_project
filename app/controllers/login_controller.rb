class LoginController < ApplicationController
    use Rack::Flash

    get "/login" do 
        @login_error = flash[:login_error]
        erb :'sessions/login'
    end

    post '/login' do 
        user = Employee.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            login_user(user)
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

end 