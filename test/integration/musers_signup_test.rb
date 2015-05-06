require 'test_helper'

class MusersSignupTest < ActionDispatch::IntegrationTest

  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'Muser.count' do
  #     post musers_path, muser: { email: "user@invalid",
  #                              password:              "foo",
  #                              password_confirmation: "bar" }
  #   end
  #   assert_template 'musers/new'
  # end

  # test "valid signup information" do
  #   get signup_path
  #   assert_difference 'Muser.count', 1 do
  #     post_via_redirect musers_path, muser: { email: "user@example.com",
  #                                           password:              "password",
  #                                           password_confirmation: "password" }
  #   end
  #   assert_template 'musers/show'
  #   assert is_logged_in?
  # end

end
