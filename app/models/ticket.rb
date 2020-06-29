class Ticket < ActiveRecord::Base
    belongs_to :employee

    validates :title, presence: true
    #validates :title, length: { minimum: 5 }
    validates :details, presence: true
    #validates :details, length: { minimum: 10 }
end 