require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :last_name, :house, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def pretty_name
    return "#{first_name} #{last_name}"
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name, last_name, house, age
    )
    VALUES
    (
      $1, $2, $3, $4
      )"
    values = [@first_name, @last_name, @house, @age]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end


end
