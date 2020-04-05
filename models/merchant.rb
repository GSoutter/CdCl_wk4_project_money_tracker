#merchant1 = Merchant.new({'name' => 'Tesco', 'img_url' => './images/Tesco.jpg'})

require_relative('../db/sql_runner')

class Merchant

  attr_accessor :name, :img_url, :active
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @img_url = options['img_url']
    if options['active'] != nil
      @active = options['active']
    else
      @active = true
    end
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO merchants
    (
      name, active, img_url
    )VALUES(
      $1, $2, $3
    )
    RETURNING id
    "
    values = [@name, @active, @img_url]
    @id = SqlRunner.run(sql, values).first()['id'].to_i
  end

  def Merchant.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE merchants SET
    (  name, active, img_url
    )=(
      $1, $2, $3
    )
    WHERE id = $4
    "
    values = [@name, @active, @img_url, @id]
    SqlRunner.run(sql, values)
  end

  def Merchant.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map {|merc| Merchant.new(merc)}
  end

  def Merchant.find_by_id(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql, values).first
    return Merchant.new(merchant)
  end





end #class end
