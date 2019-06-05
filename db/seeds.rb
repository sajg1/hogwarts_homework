require('pry')
require_relative('../models/student')
require_relative('../models/house')


Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 12
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasely",
  "house" => "Gryffindor",
  "age" => 12
  })

student3 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 12
  })

student1.save()
student2.save()
student3.save()

house1 = House.new({
  "name" => "Gryffindor"
  })

house2 = House.new({
  "name" => "Ravenclaw"
  })

house3 = House.new({
  "name" => "Hufflepuff"
  })

  house4 = House.new({
  "name" => "Slytherin"
  })


house1.save()
house2.save()
house3.save()
house4.save()

binding.pry

nil
