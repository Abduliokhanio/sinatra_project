class TicketController < ApplicationController

    get "/tickets" do #Read
        @tickets = Ticket.all
        erb :'tickets/all_tickets'
    end 
    
    get "/tickets/new" do #Create
        erb :'tickets/create_ticket'
    end
    
    post "/tickets" do #Create
        Ticket.create(title: params[:title], details: params[:details])
        redirect "/tickets"
    end
    
    get "/tickets/:id" do #Read
        @ticket = Ticket.find_by(id: params[:id])
        erb :'tickets/read_ticket'
    end
    
    get "/tickets/:id/edit" do #Update
        @ticket = Ticket.find_by(id: params[:id])
        erb :'tickets/update_ticket'
    end 
      
    patch "/tickets/:id" do #Update
        #"Process the update and redirect"
        ticket = Ticket.find_by(id: params[:id])
        ticket.update(title: params[:title], details: params[:details])
        redirect "/tickets"
    end
    
    delete "/tickets/:id" do #Delete
        #"Delete and redirect"
        ticket = Ticket.find_by(id: params[:id])
        Ticket.delete(ticket.id)
        redirect "/tickets"
    end

end 
