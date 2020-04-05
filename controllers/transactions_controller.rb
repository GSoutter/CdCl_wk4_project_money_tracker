require('sinatra')
require('sinatra/contrib')
require( 'pry-byebug' )


require_relative( '../models/merchant.rb' )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
also_reload('../models/*')


get '/transactions' do #shows all transacations page
  @transactions = Transaction.all
  erb(:"transactions/index")
end


get '/transactions/new' do   #show new transactions page
  @merchants = Merchant.all_active
  @tags = Tag.all_active
  erb(:"transactions/new")
end

get '/transactions/:id/edit' do #show edit specific transactions page
  id = params['id'].to_i
  @transaction = Transaction.find_by_id(id)
  @merchants = Merchant.all_active
  @tags = Tag.all_active
  erb(:"transactions/edit")
end


post '/transactions' do #post new transaction data to database
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

post '/transactions/:id' do #post edit transaction data to database
  transaction = Transaction.new(params)
  transaction.update
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  id = params['id']
  transaction = Transaction.find_by_id(id)
  transaction.delete()
  redirect to("/transactions")
end
