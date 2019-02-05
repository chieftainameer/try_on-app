require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:ameer)
  end

test "testing unsuccessful edits" do
	get edit_user_path(@user)
	assert_template 'users/edit'
	patch user_path(@user), params: { user: { name:"",
										email:"chiefyugj.com",
										password: "bssef15034",
										password_confirmation:"bssef15034"
											} }
	assert_template 'users/edit'				
	assert_select 'div.alert', { text:"The form contains 2 errors" }							


end

test "successful edits" do
	get edit_user_path(@user)
	assert_template 'users/edit'
	name = "example"
	email = "foo@bar.com"
	patch user_path(@user), params: { user:{ name: name, email: email, password:"", password_confirmation: "" } }
	assert_not flash.empty?
	assert_redirected_to @user
	@user.reload
	assert_equal name, @user.name
	assert_equal email, @user.email
end

end
