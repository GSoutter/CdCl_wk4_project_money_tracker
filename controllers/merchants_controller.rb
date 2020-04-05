require('sinatra')
require('sinatra/contrib')
require( 'pry-byebug' )


require_relative( '../models/merchant.rb' )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
also_reload('../models/*')


get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  erb(:"merchants/new")
end

get '/merchants/:id/edit' do
  id = params['id'].to_i
  @merchant = Merchant.find_by_id(id)
  erb(:"merchants/edit")
end



post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save
  redirect to("/merchants")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to("/merchants")
end
