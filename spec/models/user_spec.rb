require 'rails_helper'
require 'valid_email'

RSpec.describe User, type: :model do
  let(:user) { create(:user)}

  it "should have a valid user" do 
  	expect(user).to be_valid
  end



  it 'should validate presence of name' do
  	user.name = ""
  	expect(subject).to validate_presence_of(:name).with_message("can't be blank")
	end

	it 'should validate presence of email' do
		user.email = ""
		expect(subject).to validate_presence_of(:email).with_message("can't be blank")
	end

	it 'should make sure name is not too long' do
		user.name = "a" * 51
		expect(subject).to validate_length_of(:name).is_at_most(50).with_message("max val is 50")
	end

	it 'should make sure email is not too long' do
		user.email = "a" * 226
		expect(subject).to validate_length_of(:email).is_at_most(225).with_message("max val is 225")
	end

	it 'should have valid email' do
		expect(ValidateEmail.valid?(user.email)).to be true
	end

	it 'should return false for this invalid email' do
		expect(ValidateEmail.valid?('joe@doe')).to be false
	end
  
end
