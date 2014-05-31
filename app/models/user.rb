class User < ActiveRecord::Base
	has_secure_password #without this line, the whole test fails in user_spec.rb (everything)
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i #REGEX code you can learn using Rubular
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 } #has secure password line below automatically adds the presence feature
end
