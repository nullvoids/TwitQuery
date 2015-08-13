class TweetsController < ApplicationController
  def index
  	@keyword = Keyword.find(params[:keyword_id])
  	@tweets = @keyword.tweets
  end
end
