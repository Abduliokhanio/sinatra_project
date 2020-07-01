class EmployeesController < ApplicationController

  get "/signup" do 
    error_getter_signup
    erb :'users/signup' 
  end 

  post "/signup" do 
    user = Employee.new(params)
    if user.save
        login_user(user)
        redirect "/tickets"
    else
        error_setter_signup(user)
        redirect "/signup"
    end 
  end 
end