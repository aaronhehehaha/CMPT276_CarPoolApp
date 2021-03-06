require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(firstname: "Example",lastname: "User", email: "user@sfu.ca", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
      @user.firstname = ""
      assert_not @user.valid?
    end
    test "last name should be present" do
        @user.lastname = ""
        assert_not @user.valid?
      end
      test "email should be present" do
        @user.email = "   "
        assert_not @user.valid?
      end

        test "first name should be not long" do
          @user.firstname = "a"*51
          assert_not @user.valid?
        end
        test "last name should be not long" do
          @user.lastname = "a"*51
          assert_not @user.valid?
        end
        test "email should be not long" do
          @user.email = "a"*256
          assert_not @user.valid?
        end

        test "email validation should accept valid addresses" do
        #  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
        #    first.last@foo.jp alice+bob@baz.cn]
          valid_addresses = %w[user@sfu.ca]
            valid_addresses.each do |valid_address|
              @user.email = valid_address
              assert @user.valid?, "#{valid_address.inspect} should be valid"
            end
          end


              test "email addresses should be unique" do
                duplicate_user = @user.dup
                duplicate_user.email = @user.email.upcase
                @user.save
                assert_not duplicate_user.valid?
              end

              test "password should have a minimum length" do
                @user.password = @user.password_confirmation = "a" * 5
                assert_not @user.valid?
              end




end
