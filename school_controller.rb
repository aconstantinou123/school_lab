require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student.rb')
require_relative('models/house.rb')

get '/students' do
  @students = Student.list_all()
  erb(:students)
end

get '/students/new' do
  @houses = House.list_all()
  erb (:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  redirect to '/students'
end
