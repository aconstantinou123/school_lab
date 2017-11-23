require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student.rb')

get '/students' do
  @students = Student.list_all()
  erb(:students)
end

get '/students/new' do
  erb (:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  redirect to '/students'
end