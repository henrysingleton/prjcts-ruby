class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @all_topics = Topic.select(:name)
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      # Redirects to "index"
      redirect_to topics_url, notice: "Thank you for signing up!"
    else 
      render "new"
    end
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
  
  def index
    @topics = Topic.all
  end

end