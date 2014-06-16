require 'spec_helper'

describe "Authentication" do

	subject { page }

# Minimalist test which fails unless you create
	# 1. Routes in config/routes
	# 2. Define those routes in the respective controller
	# 3. Verify that the html.erb page has the right title & content

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Sign in"}

			it { should have_title('Sign in') }
			it { should have_selector('div.alert.alert-error')} #CSS classes alert & alert-error

		 	describe "after visiting another page" do
        		before { click_link "Home" }
        		it { should_not have_selector('div.alert.alert-error') } #div.alert.alert-error is basically the error banner
        	end	
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) } 
			before do
				fill_in "Email", 	with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

        	describe "Signing out" do
        		before { click_link "Sign out" }
        		it { should have_link('Sign in') }
        	end	

			it { should have_title(user.name) }
			it { should have_link('Profile', 	href: user_path(user)) }
			it { should_not have_link('Sign in', 	href: signin_path) }
			it { should have_link('Sign out', 	href: signout_path) }
		end
	end
end
