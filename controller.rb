require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/student')

also_reload('./models/*')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/:id' do
  @student = Student.find_by_id(params[:id].to_i)
  erb(:show)
end
