require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'ihouse App'" do
      visit '/static_pages/home'
      expect(page).to have_content('ihouse Complaint App')
      #expect should have the same content as the <h1> line in
      #home.HTML.erb file for it to pass
    end

   	it "should have the title 'ihouse App" do
	   visit '/static_pages/home'
  	   expect(page).to have_title("ihouse App | Home")
  	   #this means that the TITLE (not content) should have ihouse in it
	end
  end

  describe "Help" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('How to use it')
    end

   	it "should have the title 'Help'" do
	   visit '/static_pages/help'
  	   expect(page).to have_title("ihouse App | Help")
	end
  end

  describe "About us" do

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About the team')
    end

   	it "should have the title 'About us'" do
	   visit '/static_pages/about'
  	   expect(page).to have_title("ihouse App | About us")
	end
  end

end