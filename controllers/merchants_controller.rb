require('sinatra')
require('sinatra/contrib')
require( 'pry-byebug' )


require_relative( '../models/merchant.rb' )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
also_reload('../models/*')


get '/merchants' do   #show merchants index page
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do   #show new merchant page
  erb(:"merchants/new")
end

get '/merchants/:id/edit' do #show edit specific merchant page
  id = params['id'].to_i
  @merchant = Merchant.find_by_id(id)
  erb(:"merchants/edit")
end

get '/merchants/:id' do   #show single merchant page
  id = params['id'].to_i
  @merchant = Merchant.find_by_id(id)
  @transactions = @merchant.transactions
  erb(:"merchants/show")
end


post '/merchants' do #post new merchant data to database
  merchant = Merchant.new(params)
  merchant.save
  redirect to("/merchants")
end

post '/merchants/:id' do #post edit merchant data to database
  merchant = Merchant.new(params)
  merchant.update
  redirect to("/merchants")
end
