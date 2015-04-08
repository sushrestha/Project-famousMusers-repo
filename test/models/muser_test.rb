# == Schema Information
#
# Table name: musers
#
#  id              :integer          not null, primary key
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  isModerator     :integer
#

require 'test_helper'

class MuserTest < ActiveSupport::TestCase

  def setup
    @muser = Muser.new(email: "user@example.com",
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @muser.valid?
  end

  test "email should be present" do
    @muser.email = "     "
    assert_not @muser.valid?
  end

  test "email should not be too long" do
    @muser.email = "a" * 244 + "@example.com"
    assert_not @muser.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @muser.email = valid_address
      assert @muser.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @muser.email = invalid_address
      assert_not @muser.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_muser = @muser.dup
    duplicate_muser.email = @muser.email.upcase
    @muser.save
    assert_not duplicate_muser.valid?
  end

  test "password should have a minimum length" do
    @muser.password = @muser.password_confirmation = "a" * 5
    assert_not @muser.valid?
  end

end
