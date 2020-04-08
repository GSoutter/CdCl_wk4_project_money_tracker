require('sinatra')
require('sinatra/contrib')
require( 'pry-byebug' )


require_relative( '../models/merchant.rb' )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require_relative( "../models/budget.rb" )
also_reload('../models/*')


get '/budgets/edit' do #show edit budget page
  @budgets = Budget.all
  erb(:"budgets/edit")
end

post '/budgets/' do #post edit budget page
  name = params['name']
  budget = params['budget'].to_f
  Budget.budget_set(name, budget)
  redirect to("/transactions")

end
