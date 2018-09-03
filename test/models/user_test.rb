=begin
    Author: Ryan Tran
    Student number: s3201690

    Unit testing for Users
=end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @enduser = Enduser.new(
      username: "tony",
      password: "Password!23", 
      password_confirmation: "Password!23",
      first_name: "Tony", 
      last_name: "Mao", 
      date_of_birth: "2018-01-01",
      email: "tony@example.com",  
      contact_number: "0422532706",
      address: "123 fake st",
      driver_licence: "047384773")
  end
  
  test "Enduser should be valid" do
    assert @enduser.valid?
  end
  
  test "username should be present" do
    @enduser.username = nil
    assert_not @enduser.valid?
  end
  
  test "username length should be more than 2 characters" do
    @enduser.username = "a" * 3
    assert @enduser.valid?
  end
  
  test "username should be unique" do
    duplicate_user = @enduser.dup
    @enduser.save
    assert_not duplicate_user.valid?
  end
  
  test "password should be present (nonblank)" do
    @enduser.password = @enduser.password_confirmation = " " * 6
    assert_not @enduser.valid?
  end
  
  test "password should have a minimum length" do
    @enduser.password = @enduser.password_confirmation = "a" * 7
    assert_not @enduser.valid?
  end
  
  test "Enduser email should be present" do
    @enduser.email = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @enduser.email = valid_address
      assert @enduser.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "Enduser email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          user.name@example..com foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @enduser.email = invalid_address
      assert_not @enduser.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "Enduser first_name should be present" do
    @enduser.first_name = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser last_name should be present" do
    @enduser.last_name = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser date_of_birth should be present" do
    @enduser.date_of_birth = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser contact_number should be present" do
    @enduser.contact_number = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser contact_number should only be numbers" do
    @enduser.contact_number = "042a532706"
    assert_not @enduser.valid?
  end
  
  test "Enduser contact_number should be between 8 and 10 numbers" do
    invalid_contacts = %w[1234567 12345678901]
    invalid_contacts.each do |invalid_contact|
      @enduser.contact_number = invalid_contact
      assert_not @enduser.valid?, "#{invalid_contact.inspect} should be invalid"
    end
  end
  
  test "Enduser address should be present" do
    @enduser.address = nil
    assert_not @enduser.valid?
  end
  
  test "Enduser driver_licence should be present" do
    @enduser.driver_licence = nil
    assert_not @enduser.valid?
  end
  
    test "Enduser driver_licence should be 9 numbers" do
    invalid_licences = %w[12345678 1234567890]
    invalid_licences.each do |invalid_licence|
      @enduser.driver_licence = invalid_licence
      assert_not @enduser.valid?, "#{invalid_licence.inspect} should be invalid"
    end
  end
  
  
end
