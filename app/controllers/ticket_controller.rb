
class TicketController < ApplicationController
    use Rack::Flash

    get "/tickets" do #Read -index action
        if logged_in?
            @tickets = current_user.tickets
            erb :'tickets/all_tickets'
        else
            redirect '/login'
        end 
    end 
    
    get "/tickets/new" do #Create -new action
        if logged_in?
            error_getter_ticket
            erb :'tickets/create_ticket'
        else
            redirect '/login'
        end
    end
    
    post "/tickets" do #Create -create action
        if logged_in?
            ticket = current_user.tickets.build(params)
        
            if ticket.save
                redirect "/tickets"
            else
                error_setter_ticket(ticket)
                redirect  "/tickets/new"
            end 
        else
            redirect '/login'
        end
    end
    
    get "/tickets/:id" do #Read - show action
        if logged_in?
            @ticket = current_user.tickets.find_by(id: params[:id])
            
            if @ticket
                erb :'tickets/read_ticket'
            else
                redirect '/tickets'
            end
        else
            redirect '/login'
        end
    end
    
    get "/tickets/:id/edit" do #Update -edit action
        if logged_in?
            error_getter_ticket
            @ticket = current_user.tickets.find_by(id: params[:id])
            if @ticket
                erb :'tickets/update_ticket'
            else
                redirect '/tickets'
            end 
        else
            redirect '/login'
        end
    end 
      
    patch "/tickets/:id" do #Update -update action
        #"Process the update and redirect"
        if logged_in?
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
        else
            redirect '/login'
        end
    end
    
    delete "/tickets/:id" do #Delete -delete action
        #"Delete and redirect"
        if logged_in?
            ticket = current_user.tickets.find_by(id: params[:id])
            #replace delete with destroy
            if ticket
                Ticket.delete(ticket.id)
                redirect "/tickets"
            else
                redirect "/tickets"
            end 
        else
            redirect '/login'
        end        
    end



end 
