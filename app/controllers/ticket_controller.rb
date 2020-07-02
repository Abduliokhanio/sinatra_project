
class TicketController < ApplicationController
    use Rack::Flash

    get "/tickets" do #Read -index action
        logged_in_else_redirect
            @tickets = current_user.tickets
            erb :'tickets/all_tickets'
    end 
    
    get "/tickets/new" do #Create -new action
        logged_in_else_redirect
            error_getter_ticket
            erb :'tickets/create_ticket'
    end
    
    post "/tickets" do #Create -create action
        logged_in_else_redirect
        ticket = current_user.tickets.build(params)
        if ticket.save
            redirect "/tickets"
        else
            error_setter_ticket(ticket)
            redirect  "/tickets/new"
        end 
    end
    
    get "/tickets/:id" do #Read - show action
        logged_in_else_redirect
        @ticket = current_user.tickets.find_by(id: params[:id])
        
        if @ticket
            erb :'tickets/read_ticket'
        else
            redirect '/tickets'
        end
    end
    
    get "/tickets/:id/edit" do #Update -edit action
        logged_in_else_redirect
        error_getter_ticket
        @ticket = current_user.tickets.find_by(id: params[:id])
        if @ticket
            erb :'tickets/update_ticket'
        else
            redirect '/tickets'
        end 
    end 
      
    patch "/tickets/:id" do #Update -update action
        #"Process the update and redirect"
        logged_in_else_redirect
        ticket = current_user.tickets.find_by(id: params[:id])
        if ticket
            if ticket.update(title: params[:title], details: params[:details])
                redirect "/tickets"
            else 
                error_setter_ticket(ticket)
                redirect "/tickets/#{params[:id]}/edit"
            end   
        else
            redirect '/tickets'
        end 
    end
    
    delete "/tickets/:id" do #Delete -delete action
        #"Delete and redirect"
        logged_in_else_redirect
        ticket = current_user.tickets.find_by(id: params[:id])
        #replace delete with destroy
        if ticket
            Ticket.delete(ticket.id) #using delete bc it's part of activerecord 5.2.3
            redirect "/tickets"
        else
            redirect "/tickets"
        end             
    end

end 
