require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

House.delete_all()
Student.delete_all()

house1 = House.new({'name' => 'Lannister'})
house1.save()
house2 = House.new({'name' => 'Stark'})
house2.save()
house3 = House.new({'name' => 'Tully'})
house3.save()
house4 = House.new({'name' => 'Greyjoy'})
house4.save()
house5 = House.new({'name' => 'Frey'})
house5.save()

House.list_all()

student1 = Student.new({'first_name' => 'Myra', 'second_name' => 'Hindley', 'house_id' => house1.id, 'age' => 29})
student1.save()
student2 = Student.new({'first_name' => 'Charles', 'second_name' => 'Manson', 'house_id' => house2.id, 'age' => 29})
student2.save()
student3 = Student.new({'first_name' => 'John Wayne', 'second_name' => 'Gacey', 'house_id' => house3.id, 'age' => 29})
student3.save
student4 = Student.new({'first_name' => 'Ted', 'second_name' => 'Bundy', 'house_id' => house4.id, 'age' => 29})
student4.save()
student5 = Student.new({'first_name' => 'Jeffrey', 'second_name' => 'Dharma', 'house_id' => house5.id, 'age' => 29})
student5.save()

Student.list_all()

binding.pry
nil
