class CreateTicketsTable < ActiveRecord::Migration[5.2]

    def change 
        create_table :tickets do |t|
        t.string :title
        t.string :details
        t.integer :employee_id
  
        t.timestamps
        end 
    end 
end 