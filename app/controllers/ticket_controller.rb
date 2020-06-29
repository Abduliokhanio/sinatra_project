
class TicketController < ApplicationController
    use Rack::Flash

    get "/tickets" do #Read
        if logged_in?
            @tickets = current_user.tickets
            erb :'tickets/all_tickets'
        else
            redirect '/login'
        end 
    end 
    
    get "/tickets/new" do #Create
        if logged_in?
            @error_title = flash[:title_error]
            @error_details = flash[:details_error]
            erb :'tickets/create_ticket'
        else
            redirect '/login'
        end
    end
    
    post "/tickets" do #Create
        if logged_in?
            ticket = current_user.tickets.build(params)
        
            if ticket.save
                redirect "/tickets"
            else
                flash[:title_error] = ticket.errors.messages[:title]
                flash[:details_error] = ticket.errors.messages[:details]
                redirect  "/tickets/new"
            end 
        else
            redirect '/login'
        end
    end
    
    get "/tickets/:id" do #Read
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
    
    get "/tickets/:id/edit" do #Update
        if logged_in?
            @error_title = flash[:title_error]
            @error_details = flash[:details_error]
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
      
    patch "/tickets/:id" do #Update
        #"Process the update and redirect"
        if logged_in?
            ticket = current_user.tickets.find_by(id: params[:id])
            if ticket
                if ticket.update(title: params[:title], details: params[:details])
                    redirect "/tickets"
                else 
                    flash[:title_error] = ticket.errors.messages[:title]
                    flash[:details_error] = ticket.errors.messages[:details]
                    redirect "/tickets/#{params[:id]}/edit"
                end
                
            else
                redirect '/tickets'
            end 
        else
            redirect '/login'
        end
    end
    
    delete "/tickets/:id" do #Delete
        #"Delete and redirect"
        if logged_in?
            ticket = current_user.tickets.find_by(id: params[:id])
            Ticket.delete(ticket.id)
            redirect "/tickets"
        else
            redirect '/login'
        end        
    end

end 
