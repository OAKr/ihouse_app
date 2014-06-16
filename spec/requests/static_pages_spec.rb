require 'spec_helper'

describe "Static pages" do
 subject { page }

	let(:base_title) {"ihouse App"}

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title ( full_title(page_title))}
  end
    
  describe "Home page" do
     before {visit root_path}
     let(:heading) {'ihouse Complaint Web App'}
     let(:page_title) {''}

     it_should_behave_like "all static pages"
     it { should_not have_title('| Home')}
   end
      #expect should have the same content as the <h1> line in
      #home.HTML.erb file for it to pass

  describe "Help" do
    before { visit help_path}

    let(:heading) {'How it works'}
    let(:page_title) {'Help'}

    it_should_behave_like "all static pages"
  end

  describe "About us" do
    before {visit about_path}

    let(:heading) {'About the team'}
    let(:page_title) {'About us'}

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before {visit contacts_path}

    let(:heading) {'Contact us'}
    let(:page_title) {'Contact us'}

    it_should_behave_like "all static pages"
  end

  #Testing for links on the page
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contacts"
    expect(page).to have_title(full_title('Contact us'))
    click_link "Sign in"
    expect(page).to have_title(full_title('Sign in'))
    click_link "ihouse app"
    expect(page).to have_content('Sign in')
  end
end
