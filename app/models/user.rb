class User < ActiveRecord::Base
  attr_accessible :admin, :name, :password

  has_many :topics

  def self.authenticate(name, password)
    user = find_by_name(name)
    return user if user && user.authenticated?(password)
  end
end
