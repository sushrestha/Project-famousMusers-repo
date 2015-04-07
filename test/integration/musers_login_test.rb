require 'test_helper'

class MusersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @muser = musers(:homer)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, session: { email: @muser.email, password: 'password' }
    assert_redirected_to @muser
    follow_redirect!
    assert_template 'musers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", muser_path(@muser)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @muser.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @muser
    follow_redirect!
    assert_template 'musers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", muser_path(@muser)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", muser_path(@muser), count: 0
  end

end
