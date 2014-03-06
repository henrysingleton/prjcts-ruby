class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @all_topics = Topic.select(:name)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    render "new"
  end

  def topic_params
    # Figured out that this is required in Rails 4. 
    # It could also be written as 
    #   `params[:topic].permit(:name, :upvotes, :downvotes)`
    # But of course you would no longer require the :topic param element exists. 
    params.require(:topic).permit(:name, :upvotes, :downvotes)
  end

  def vote
  end
end