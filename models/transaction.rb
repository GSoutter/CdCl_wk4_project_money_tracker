require_relative('../db/sql_runner')
require('date')

class Transaction

  attr_accessor :transaction_timestamp, :amount, :merchant_id, :tag_id
  attr_reader :id

  def initialize(options)

    if options['transaction_timestamp'] == nil or options['transaction_timestamp'] == ""
      @transaction_timestamp = DateTime.now
    else
      @transaction_timestamp = options['transaction_timestamp']
    end

    @amount = options['amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i

    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      transaction_timestamp, amount, merchant_id, tag_id
    )VALUES(
      $1, $2, $3, $4
    )
    RETURNING id
    "
    values = [@transaction_timestamp, @amount, @merchant_id, @tag_id]
    @id = SqlRunner.run(sql, values).first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET
    (
      transaction_timestamp, amount, merchant_id, tag_id
    )=(
      $1, $2, $3, $4
    )
    WHERE id = $5
    "
    values = [@transaction_timestamp, @amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end


  def Transaction.all()
    sql = "SELECT * FROM transactions ORDER BY transaction_timestamp DESC"
    transactions = SqlRunner.run(sql)
    return transactions.map {|tran| Transaction.new(tran)}
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    merchant = SqlRunner.run(sql, values).first()
    return Merchant.new(merchant)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    tag = SqlRunner.run(sql, values).first()
    return Tag.new(tag)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Transaction.total_spend(transactions)
    return transactions.reduce(0.0){|sum, tran| sum + tran.amount}
  end

  def Transaction.find_by_id(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values).first()
    return Transaction.new(transaction)
  end


  def time_html()
    d = DateTime.parse(@transaction_timestamp)

    date_string = "#{d.year}-#{"%02d" % d.month}-#{"%02d" % d.day}T#{"%02d" % d.hour}:#{"%02d" % d.min}"
    return date_string
  end

  def Transaction.months_batch
    transactions = Transaction.all
    months_array = []
    for transaction in transactions
      datetime = DateTime.parse(transaction.transaction_timestamp)
      months_array.push([datetime.year, datetime.month])
    end
    return months_array.uniq
  end

  def Transaction.filter_month(year, month)
    sql = "SELECT * FROM transactions
    WHERE EXTRACT(YEAR FROM transaction_timestamp) = $1
    AND EXTRACT(MONTH FROM transaction_timestamp) = $2
    "
    values = [year, month]
    transactions = SqlRunner.run(sql, values)
    return transactions.map {|tran| Transaction.new(tran)}
  end








end #class end
