class Employee < ActiveRecord::Base
    has_many :tickets  
    has_secure_password  
    
    #name 
    validates :name,:username,:password, presence: true
 
    #username 
    validates :username, uniqueness: true
    
end