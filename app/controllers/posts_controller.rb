class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.posts.create(params[:post])
    redirect_to @topic
  end
end
