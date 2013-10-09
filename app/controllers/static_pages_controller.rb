class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

	def about
	end
	
	def contact
		puts "Hello world from contact page"
	end
end
