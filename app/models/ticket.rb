class Ticket < ActiveRecord::Base
    belongs_to :employee

    #Ticket Title Validatiors
    validates :title, presence: true
    validates :title, length: { in: 2..100 }

    #Ticket Detail Validators
    validates :details, presence: true
    validates :details, length: { in: 6..1000 }

end 