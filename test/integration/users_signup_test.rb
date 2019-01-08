require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
  get signup_path
  assert_no_difference 'User.count' do 
  	post users_path, params: { user: {
  		name:"", 
  		email:"chieftainameer96@gmail",
  		password:"bs4",
  		password_confirmation:"bs0"
  	} }
  end
  	assert_template 'users/new'
  	assert_select 'div#error_explanation'
  	assert_select 'div.alert-danger'
  	assert_select 'form[action="/signup"]'

end

test "valid signup information" do
	get signup_path

	assert_difference 'User.count', 1 do
		post users_path, params: {  user: {
			name:"ali",
			email:"ali@gmail.com",
			password:"bssef1034",
			password_confirmation:"bssef1034"
		}}
	end
	follow_redirect!
	assert_template 'users/show'
	assert_not flash.empty?
end

end
