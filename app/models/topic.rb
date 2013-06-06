class Topic < ActiveRecord::Base
  attr_accessible :body, :name

  belongs_to :user
  has_many :posts, :dependent => :destroy

  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['body ILIKE ?', "%#{search_query}%"])
    else
      find(:all)
    end
  end
end
