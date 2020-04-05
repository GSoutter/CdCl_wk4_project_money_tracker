require('sinatra')
require('sinatra/contrib')
require( 'pry-byebug' )


require_relative( '../models/merchant.rb' )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
also_reload('../models/*')


get '/tags' do #show index page
  @tags = Tag.all
  erb(:"tags/index")
end

get '/tags/new' do #show new tag creation page
  erb(:"tags/new")
end

get '/tags/:id/edit' do #show edit specific tag page
  id = params['id'].to_i
  @tag = Tag.find_by_id(id)
  erb(:"tags/edit")
end


post '/tags' do #post new Tag to database
  tag = Tag.new(params)
  tag.save
  redirect to("/tags")
end

post '/tags/:id' do #post edit tag data to database
  tag = Tag.new(params)
  tag.update
  redirect to("/tags")
end
