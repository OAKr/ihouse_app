require 'spec_helper'

describe "Static pages" do
 subject { page }

	let(:base_title) {"ihouse App"}

  describe "Home page" do
     before {visit root_path}

    it { should have_content('ihouse Complaint Web App') }
    it { should have_title(full_title('')) }
    it { should_not have_title ('| Home') }
      #expect should have the same content as the <h1> line in
      #home.HTML.erb file for it to pass
  end

  describe "Help" do
    before { visit help_path}

    it { should have_content( 'How to use it') }
    it { should have_title ( "#{base_title} | Help") }
  end

  describe "About us" do
    before {visit about_path}

    it { should have_content('About the team') }
    it { should have_title ( "#{base_title} | About us") }
  end
 
  describe "Contact page" do
    before {visit contacts_path}

    it { should have_content( 'Contact us') }
    it { should have_title ( "#{base_title} | Contact us") }
  end
end
