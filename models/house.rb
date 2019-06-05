require_relative('../db/sql_runner')

class House

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

end
