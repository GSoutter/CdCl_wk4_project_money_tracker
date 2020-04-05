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



post '/tags' do #post new Tag to database
  tag = Tag.new(params)
  tag.save
  redirect to("/tags")
end
