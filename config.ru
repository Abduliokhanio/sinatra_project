require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# allows us to use PATCH and DELETE routes
use Rack::MethodOverride

use LoginController
use EmployeesController
use TicketController
run ApplicationController
