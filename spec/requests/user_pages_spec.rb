require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before {visit user_path(user)}
  	
  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end



  describe "signup page" do
    before { visit register_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Register')) }
  end

  describe "signup" do
    before { visit register_path} #supposed to be register path

    let(:submit) {"Create new account"}

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",                   with: "Kwame Owusu-Ansah"
        fill_in "Email",                  with: "kwame@oak.com"
        fill_in "Password",               with: "anything"
        fill_in "Confirmation",           with: "anything"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end 
end