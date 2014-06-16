class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
#must run bundle exec rake db:migrate and test:prepare for the test to pass