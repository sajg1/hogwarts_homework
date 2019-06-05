require_relative('../db/sql_runner')
require_relative('house')

class Student

  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def pretty_name
    return "#{first_name} #{last_name}"
  end

#CREATE

  def save()
    sql = "INSERT INTO students
    (
      first_name, last_name, house_id, age
    )
    VALUES
    (
      $1, $2, $3, $4
      ) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

# READ

  def house()
    sql = "SELECT * FROM houses WHERE houses.id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values).first
    house = House.new(result)
    result = house.name()

  end

#DELETE

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

#READ

  def self.all()
    sql = "SELECT * FROM students"
    results = SqlRunner.run(sql)
    results.map {|student| Student.new(student)}
  end

#READ

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Student.new(result.first)
  end


end
