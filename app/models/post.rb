class Post < ActiveRecord::Base
  attr_accessible :body, :name, :topic_id
  belongs_to :topic
end
