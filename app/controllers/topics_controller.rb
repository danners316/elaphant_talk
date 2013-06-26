class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def index

    @topics = Topic.order("created_at DESC")
    @topics = Topic.search(params[:search_query])
    @todays = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
    @month = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month])
    @this_years = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_year, Time.zone.now.end_of_year])


  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    if current_user
    @topic = Topic.find(params[:id])
    @title = @topic.body
    @post = Post.new(params[:post])
    @posts = @topic.posts
    else redirect_to root_path,
    :notice => 'Login To View Topics'
      end
  end

  def todays
    @topics = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
  end

  def month
    @topics = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month])

  end

  def year
    @topics = Topic.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_year, Time.zone.now.end_of_year])

  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end
