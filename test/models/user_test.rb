require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  test "ユーザーが存在するか" do
    assert @user.valid?
  end

  test "ユーザー名があるか" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "メールアドレスがあるか" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "ユーザー名が長すぎないか" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "メールアドレスが長すぎないか" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "メールアドレスが有効なフォーマットか" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "メールアドレスが有効なフォーマットか2" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                   foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "メールアドレスの一意性と大文字、小文字の区別を検証する" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "メールアドレスの小文字化" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end