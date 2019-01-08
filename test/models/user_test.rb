require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user=User.new(name: "ameer", email: "chieftainameer96@gmail.com", password:"ameer96", password_confirmation:"ameer96")
  end

test "should be valid" do
	
	assert_not @user.valid?

end
test "name should be present" do
	@user.name= ""
	assert_not @user.valid?, "name should be present"
end
test "email should be present" do
	
	@user.email="chieftanmeer96gmail.com"
	assert_not @user.valid?, "email should be present"

end

test "name should not be too long" do
	
	@user.name = "a" * 51
	assert_not @user.valid?, "name should be under 50 charcters"

end

test "email should not be too long" do
	
	@user.email = "a" * 256
	assert_not @user.valid?, "email should be under 255 charcters"

end

test "email should be of valid format" do
	
	valid_addresses = %w[user@example.com user_are@sbc.org  User.NAME@example.com foo@bar.com ]

	valid_addresses.each do |valid_address|
		@user.email = valid_address
		assert_not @user.valid?, "#{valid_address.inspect} is invalid"
	end


end

test "email should be unique" do
	
	duplicate_user = @user.dup
	duplicate_user.email = @user.email.upcase
	@user.save
	assert_not duplicate_user.valid?


end

test "password should be present" do
	@user.password = @user.password_confirmation = "" * 6
	assert_not @user.valid?
end

test "password should be atleast 6 characters long" do
	@user.password = @user.password_confirmation = "" * 6
	assert_not @user.valid?
end

end
