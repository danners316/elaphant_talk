class Topic < ActiveRecord::Base
  attr_accessible :body, :name, :id

  belongs_to :user
  has_many :posts, :dependent => :destroy

  def self.search(search_query)
    if search_query
      find(:all, :conditions => ['body LIKE ?', "%#{ search_query}%"])
    else
      find(:all)
    end
  end
end
