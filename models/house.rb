require_relative('../db/sql_runner')

class House

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'] if options['id']
  end

# CREATE

  def save()
    sql = "INSERT INTO houses
    (
      name
    )
    VALUES
    (
      $1
    ) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

# READ

  def self.delete_by_id(id)
    sql = "DELETE FROM houses WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

# READ

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    houses.map {|house| House.new(house)}
  end

# DELETE

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end
end
