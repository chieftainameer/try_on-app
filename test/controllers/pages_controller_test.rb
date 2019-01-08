require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | Ruby on Rails"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Ruby on Rails"
  end
  
  test "should get about page" do
  	get about_path
  	assert_response :success
    assert_select "title", "About | Ruby on Rails"

  end

  test "should get contact page" do
  	get contact_path
  	assert_response :success
   assert_select "title", "Contact | Ruby on Rails"

  end

end
