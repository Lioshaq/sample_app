require 'spec_helper'

describe "StaticPages" do
	let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1',			text: heading) }
		it { should have_selector('title',	text: full_title(page_title)) }
	end

  describe "Home page" do
		before { visit root_path }
		let(:heading)	{"Rails"}		
		let(:page_title) {''}

		it_should_behave_like "all static pages"
		it "should have the title Home" do
			should have_selector('title', :text => '| Home')
		end
  end
	
	describe "Help Page" do
		before { visit help_path }
		let(:heading) {''}		
		let(:page_title) {'Help'}
		
		it_should_behave_like "all static pages"
	end
	
	describe "About page" do
	before { visit about_path }
		it "should have content Abouts us" do	
			should have_content('About us')
		end
	end
	
	describe "Contact page" do
		it "should have title Contact" do
			visit contact_path
			should have_selector('title', :text => "Contact")
		end
	end
	
	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'title', text: full_title('About us')
		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')
		click_link "Home"
		click_link "Sign up"
		page.should have_selector 'title', text: full_title('Sign up')
		
	end	
end
