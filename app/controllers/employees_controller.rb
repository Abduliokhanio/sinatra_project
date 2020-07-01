class EmployeesController < ApplicationController

  get "/signup" do 
    error_getter_signup
    erb :'users/signup' 
  end 

  post "/signup" do 
    employee = Employee.new(params)
    if employee.save
        login_user(employee)
        redirect "/tickets"
    else
        error_setter_signup(employee)
        redirect "/signup"
    end 
  end 
end