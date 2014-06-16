class AddStudentNumberToUsers < ActiveRecord::Migration
  def change
  	add_column 	:users, :student_number, :string
  end
end

#must run bundle exec rake db:migrate and test:prepare for the test to pass
