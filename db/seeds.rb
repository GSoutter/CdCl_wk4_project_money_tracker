require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require("pry-byebug")

Merchant.delete_all()
# Tag.delete_all()
# Transaction.delete_all()

merchant1 = Merchant.new({'name' => 'Tesco', 'img_url' => './images/Tesco.jpg'})
merchant1.save()

merchant2 = Merchant.new({'name' => 'Wiggle', 'img_url' => './images/bike.jpg'})
merchant2.save()

merchant3 = Merchant.new({'name' => 'Apple', 'img_url' => './images/apple_logo.jpg'})
merchant3.save()






binding.pry
nil
