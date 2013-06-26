class User < ActiveRecord::Base
  attr_accessible :admin, :name, :password

  has_many :topics
  has_many :posts
  has_many :topics_with_posts, :through => :posts, :source => :topic

  def self.authenticate(name, password)
    user = find_by_name(name)
    return user if user && user.authenticated?(password)
  end
end
