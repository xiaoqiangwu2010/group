class User < ActiveRecord::Base
  
  validates :name, :email, :password, :image_url, :description, :presence => true
  validates :password, :length => { :minimum => 8, :maximum => 20}
  validates :email, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  
end
