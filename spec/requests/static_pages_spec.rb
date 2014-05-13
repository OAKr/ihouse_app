require 'spec_helper'

describe "Static pages" do

	let(:base_title) {"ihouse App"}

  describe "Home page" do

    it "should have the content 'ihouse App'" do
      visit '/static_pages/home'
      expect(page).to have_content('ihouse Complaint App')
      #expect should have the same content as the <h1> line in
      #home.HTML.erb file for it to pass
    end

   	it "should have the title 'ihouse App" do
	     visit '/static_pages/home'
  	   expect(page).to have_title("#{base_title} | Home")
  	   #this means that the TITLE (not content) should have ihouse in it
    end

    it "should have a custom page title" do
      visit "/static_pages/home"
      expect(page).not_to have_title('| Home')
    end 
  end

  describe "Help" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('How to use it')
    end

   	it "should have the title 'Help'" do
	   visit '/static_pages/help'
  	   expect(page).to have_title("#{base_title} | Help")
	end
  end

  describe "About us" do

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About the team')
    end

   	it "should have the title 'About us'" do
	   visit '/static_pages/about'
  	   expect(page).to have_title("#{base_title} | About us")
	end
  end
 
  describe "Contact page" do

    it "should have the content 'Contact us'" do
      visit '/static_pages/contacts'
      expect(page).to have_content('Contact us')
    end

   	it "should have the title 'Contact us'" do
	   visit '/static_pages/contacts'
  	   expect(page).to have_title("#{base_title} | Contact us")
	end
  end
end