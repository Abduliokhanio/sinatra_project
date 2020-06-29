class Employee < ActiveRecord::Base
    has_many :tickets  
    has_secure_password  
    
    validates :username, presence: true
    validates :password, presence: true
end