require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require_relative( "../models/budget.rb" )
require("pry-byebug")


Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


merchant1 = Merchant.new({'name' => 'Tesco', 'active' => true, 'img_url' => './images/Tesco.jpg'})
merchant1.save()

merchant2 = Merchant.new({'name' => 'Wiggle', 'active' => true, 'img_url' => './images/bike.jpg'})
merchant2.save()

merchant3 = Merchant.new({'name' => 'Apple', 'active' => true, 'img_url' => './images/apple_logo.jpg'})
merchant3.save()



tag1 = Tag.new({
  'name'=> 'Groceries',
  'active' => true,
  'img_url' => './images/bag.jpg'})
tag1.save()

tag2 = Tag.new({
  'name'=> 'Health',
  'active' => true,
  'img_url' => './images/heart.jpg'})
tag2.save()

tag3 = Tag.new({
  'name'=> 'Tech',
  'active' => true,
  'img_url' => './images/wires.jpg'})
tag3.save()

transaction1 = Transaction.new({
  'transaction_timestamp' => '2019-04-03 17:00',
  'amount' => '20.20',
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  'transaction_timestamp' => '2019-04-03 13:00',
  'amount' => '100.50',
  'merchant_id' => merchant2.id,
  'tag_id' => tag2.id
  })
transaction2.save()


transaction3 = Transaction.new({
  'transaction_timestamp' => '2020-04-02T12:00',
  'amount' => '1000',
  'merchant_id' => merchant3.id,
  'tag_id' => tag3.id
  })
transaction3.save()

transaction4 = Transaction.new({
  'amount' => '1000',
  'merchant_id' => merchant2.id,
  'tag_id' => tag3.id
  })
transaction4.save()

binding.pry
nil
