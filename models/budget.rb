require_relative('../db/sql_runner')

class Budget


  attr_accessor :budget
  attr_reader :name

  def initialize(options)
    @name = options['name']
    @budget = options['budget']
  end


  def Budget.update(name)
    sql = "UPDATE budgets SET
    (  budget
    )=(
      $1
    )
    WHERE name = $2
    "
    values = [@budget, @name]
    SqlRunner.run(sql, values)
  end

  def Budget.budget(name)
    sql = "SELECT budget FROM budgets WHERE name = $1"
    values = [name]
    budget = SqlRunner.run(sql, values).first()
    return nil if budget == nil
    return budget['budget'].to_f
  end

  def Budget.budget_set(name, budget)
    sql = "UPDATE budgets SET budget = $1 WHERE name = $2"
    values = [budget, name]
    SqlRunner.run(sql, values)
  end





end #class end
