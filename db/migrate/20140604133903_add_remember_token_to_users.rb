class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column 	:users, :remember_token, :string
  	add_index 	:users,	:remember_token
  end
end

#must run bundle exec rake db:migrate and test:prepare for the test to pass