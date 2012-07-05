require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:image_url].any?
    assert user.errors[:description].any?
  end
  
  
  test "user password should have 8 to 20 characters" do
    user = User.new(:name         => "xqw",
                    :email        => "fdsakj;fdjl;afjy;afj;ajfjd;ajdf@gmail.com",
                    :image_url    => "/images/xqw.jpg",
                    :description  => "I'm cool.")
    # password is too short
    user.password = "pass"
    assert user.invalid?
    
    # password is of right length
    user.password = "password"
    assert user.valid?
    user.password = "password  password  "
    assert user.valid?
    
    # password is too long
    user.password = "password  password  t"
    assert user.invalid?
  end
  
  test "user is invalid without a unique email" do
    user = User.new(:name         => "xqw",
                    :email        => users(:xqw).email,
                    :password     => "password",
                    :image_url    => "/images/xqw.jpg",
                    :description  => "I'm cool.")
           
    assert user.invalid?
    assert !user.save
    assert_equal "has already been taken", user.errors[:email].join('; ')
    
    # compare the response against the built-in error message table
    assert_equal I18n.translate('activerecord.errors.messages.taken'), user.errors[:email].join('; ')
  end
  
  def new_user(image_url)
    User.new(:name         => "xqw",
             :email        => "xiaoqiangwu.work@gmail.com",
             :password     => "password",
             :image_url    => image_url,
             :description  => "I'm cool."
            )  
  end
  
  test "image_url" do
    ok = %w{ abc.jpg def.jpg xqw.png fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://facebook.com/xiaoqiangwu.jpg }
    bad = %w{ fred.doc abc.abc def.def xqw.xqw fred.gif/more fred.gif.more }
    
    ok.each do |image_url|
      assert new_user(image_url).valid?, "#{image_url} should not be invalid"
    end 
    
    bad.each do |image_url|
      assert new_user(image_url).invalid?, "#{image_url} should not be valid"
    end
  end
  
end
