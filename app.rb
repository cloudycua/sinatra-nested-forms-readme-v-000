require_relative 'config/environment'

class App < Sinatra::Base

# serve the form in the browser
  get '/' do
    erb :new
  end

# process the input from the user
# and to display the student and their courses
  post '/student' do

  # create new Student using info stored in params[:student]
  # which contains the student's name, grade and courses
    @student = Student.new(params[:student])

  # itereate over params[:student][:courses]
  # which is an array containing a series of hashes
  # that each store individual course info
    params[:student][:courses].each do |details
    # use the course values passed into the .each block
    # to create instances of our Course class.
      Course.new(details)
    end

  # store the instantiated courses in the @courses instance variable
  # making the course info available within the student.erb view
    @courses = Course.all

  # loads the student.erb file so we can see all of the newly-created
  # student and course info in the browser
    erb :student
  end

end
