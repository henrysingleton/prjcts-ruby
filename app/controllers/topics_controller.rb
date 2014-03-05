class TopicsController < ApplicationController
  def new
  	@topic = Topic.new
  	@all_topics = Topic.select(:name)
  end

  def create
  	@topic = Topic.new(params[:topic])
  	@topic.save
  	render "new"
  end

  def vote
  end
end