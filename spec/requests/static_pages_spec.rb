require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'sample app'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
	    	page.should have_selector('h1', :text => 'Sample App')
		end
		it "should have the title Home" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")
		end
  end
	
	describe "Help Page" do
		it "Should have the content help" do
			visit '/static_pages/help'
			page.should have_content('help')
		end
	end
	
	describe "About page" do
		it "should have content Abouts us" do	
			visit '/static_pages/about'
			page.should have_content('About us')
		end
	end
end
