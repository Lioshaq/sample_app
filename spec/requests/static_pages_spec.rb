require 'spec_helper'

describe "StaticPages" do
	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
		before { visit root_path }
    it "should have the content 'sample app'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    	page.should have_selector('h1', :text => 'Rails')
		end
		it "should have the title Home" do
			page.should have_selector('title', :text => "#{base_title}")
		end
  end
	
	describe "Help Page" do
		before { visit help_path }
		it "Should have the content help" do
			page.should have_content('help')
		end
	end
	
	describe "About page" do
	before { visit about_path }
		it "should have content Abouts us" do	
			page.should have_content('About us')
		end
	end
	
	describe "Contact page" do
		it "should have title Contact" do
			visit contact_path
			page.should have_selector('title', :text => "Contact")
		end
	end
end
