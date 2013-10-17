# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
	before { @user = User.new(name: "Example user", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }
	
	subject { @user }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) } 

	describe "when name is not present" do
		before { @user.name = " "}
		it { should_not be_valid }
	end

	describe "when ename is not present" do
		before { @user.email = " "}
		it { should_not be_valid }
	end

	describe "when name too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email format is valid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at.org ex@foo.foo@gm]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end			
	
	describe "valid format emails" do 
		it "should be valid" do
			addresses = %w[user@foo.com asdf.gdfg@m.irg]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	describe "email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.save
		end
		it { should_not be_valid }
	end
	
	describe "when password not present" do	
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end
	
	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end
	
	describe "when pass conf nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end 
	
	describe "return value of authe method" do
		before do
			@user.save 
		end	
		let(:found_user) { User.find_by_email(@user.email) }
		describe 'with valid password' do
			it do
				should == found_user.authenticate(@user.password) 
			end
		end 

		describe 'with invalid password' do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }			
			it { should_not == user_for_invalid_password }
			specify { user_for_invalid_password.should be_false }			
		end
	end
end
