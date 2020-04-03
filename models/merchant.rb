#merchant1 = Merchant.new({'name' => 'Tesco', 'img_url' => './images/Tesco.jpg'})

require_relative('../db/sql_runner')

class Merchant

  attr_accessor :name, :img_url
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @img_url = options['img_url']

    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO merchants
    (
      name, img_url
    )VALUES(
      $1, $2
    )
    RETURNING id
    "
    values = [@name, @img_url]
    @id = SqlRunner.run(sql, values).first()['id'].to_i
  end

  def Merchant.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE merchants SET
    ( name, img_url
    )=(
      $1, $2
    )
    WHERE id = $3
    "
    values = [@name, @img_url, @id]
    SqlRunner.run(sql, values)
  end





end #class end
