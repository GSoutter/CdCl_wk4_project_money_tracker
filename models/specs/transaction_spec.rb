require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( "../merchant.rb" )
require_relative( "../tag.rb" )
require_relative( "../transaction.rb" )



class TransactionTest < Minitest::Test

  def setup
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
      'transaction_timestamp' => '2019-04-01 11:00',
      'amount' => '1000',
      'merchant_id' => merchant3.id,
      'tag_id' => tag3.id
      })
    transaction3.save()

    @transaction_array = Transaction.all()
  end

  def test_Transaction_total_spend()
    #given an array of transactions

    #when i run Transaction.total_spend(array)
    assert_equal(1120.70, Transaction.total_spend(@transaction_array))
  end


end # class end
