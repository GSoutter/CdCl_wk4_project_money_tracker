require_relative('../db/sql_runner')

class Tag

  attr_accessor :name, :active, :img_url
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


  def Tag.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map {|tag| Tag.new(tag)}
  end

  def Tag.find_by_id(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql, values).first
    return Tag.new(tag)
  end

  def Tag.all_active()
    sql = "SELECT * FROM tags WHERE active = 't'"
    tags = SqlRunner.run(sql)
    return tags.map {|tag| Tag.new(tag)}
  end

  
  def transactions
    sql = "SELECT * FROM transactions WHERE tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map {|tran| Transaction.new(tran)}
  end

end #class end
