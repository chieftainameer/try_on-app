require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "checks whether right view is rendered" do
		get root_path
		assert_template 'pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", about_path
	end

	test "checks if signup page is renderd" do
		get signup_path
		assert_template 'user/new'
		assert_select 'a[href=?]', root_path, count: 2
		assert_select 'a[href=?]', about_path
	end
	end