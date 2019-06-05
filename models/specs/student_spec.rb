require('minitest/autorun')
require('minitest/rg')
require_relative('../student')

class StudentTest < Minitest::Test

  def setup

    options = {
      "id" => 1,
      "first_name" => "Harry",
      "last_name" => "Potter",
      "house" => "Gryffindor",
      "age" => 12
    }

    @student1 = Student.new(options)
  end

  def test_first_name
    assert_equal("Harry", @student1.first_name)
  end

  def test_last_name
    assert_equal("Potter", @student1.last_name)
  end

  def test_house
    assert_equal("Gryffindor", @student1.house)
  end

  def test_age
    assert_equal(12, @student1.age)
  end

  def test_pretty_name
    assert_equal("Harry Potter", @student1.pretty_name)
  end



end
