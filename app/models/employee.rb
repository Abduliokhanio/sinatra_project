class Employee < ActiveRecord::Base
    has_many :tickets  
    has_secure_password  
    
    #name 
    validates :name, presence: true
 
    #username 
    validates :username, presence: true
    validates :username, uniqueness: true
    
    #password
    validates :password, presence: true
end