require_relative('../db/sql_runner.rb')

class Student

  attr_reader :first_name, :second_name, :house, :age, :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{|student| Student.new(student)}
  end

  def save()
    sql = "INSERT INTO students (
    first_name,
    second_name,
    house_id,
    age
    ) VALUES (
    $1, $2, $3, $4
    ) RETURNING *"
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE students SET (
    first_name,
    second_name,
    house_id,
    age
    ) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@first_name, @second_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    return Student.new(student)
  end

  def house()
    sql =  'SELECT houses.*
            FROM houses
            INNER JOIN students
            ON students.house_id = houses.id
            WHERE students.house_id = $1'
    values = [@house_id]
    house = SqlRunner.run(sql, values).first
    return House.new(house)
  end

end
