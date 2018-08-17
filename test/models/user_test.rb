require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is valid' do
    user = User.new(
	first_name: 'Tony',
	last_name: 'Mao',
	type: 'endUser',
	date_of_birth: '2018-01-01',
	contact_number: '0422532706', 
	username: 'tony',
	password: 'pass12345',
	email: 'tony@example.com',
	address: '123 fake st', 
	driver_licence: '047384773')
    assert user.valid?
  end

  test 'first_name is valid' do
  	#check first_name input length minimum 2
  end
  test 'last_name is valid' do
  	#check last_name input length minimum 2
  end
  test 'date_of_birth is valid' do
  	#check date_of_birth input 'date' format
  end
  test 'email is valid' do
  	#check email input 'email' format
  end
  test 'contact_number is valid' do
  	#check contact_number input 'tel' format
  end
  test 'address is valid' do
  	#check address input 'address' format
  end
  test 'driver_licence is valid' do
  	#check driver_licence input with validation
  end

end
