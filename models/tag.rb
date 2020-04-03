require_relative('../db/sql_runner')

class Tag

  attr_accessor :name, :active, :img_url
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @active = options['active']
    @img_url = options['img_url']

    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO tags
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


  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end


  def update()
    sql = "UPDATE tags SET
    (  name, active, img_url
    )=(
      $1, $2, $3
    )
    WHERE id = $4
    "
    values = [@name, @active, @img_url, @id]
    SqlRunner.run(sql, values)
  end




end #class end
