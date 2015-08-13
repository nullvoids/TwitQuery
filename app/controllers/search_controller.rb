class SearchController < ApplicationController
  include TwitterRequestHandler
  def index
  	raise ActionController::RoutingError.new('Not Found') if params[:q].nil?
  	query = params[:q]
  	bearer_token = session[:twitter_bearer_token] || obtain_bearer_token
  	twitter_response = search_tweets( query, bearer_token )
  	@tweet_data = map_statuses_to_users( twitter_response )
  	store_query( query, @tweet_data )
  end

  private
  def map_statuses_to_users( twitter_response )
  	status_to_user_map = {}
  	twitter_response.parsed_response['statuses'].each do |status|
  		status_to_user_map[status['id_str']] = {
  			username: status['user']['screen_name'],
  			text: status['text'],
  			url: "https://twitter.com/#{status['user']['screen_name']}/status/#{status['id_str']}"
  		}
  	end
  	status_to_user_map
  end

  def store_query( query, tweet_data )
  	new_keyword = Keyword.create( content: query )
  	tweet_data.each do |tweet|
  		twitter_link = tweet[1][:url]
  		existing_tweet = Tweet.where( url: twitter_link ).first
  		if existing_tweet.present? 
  			new_keyword.tweets << existing_tweet
  		else
  			new_keyword.tweets << Tweet.create( content: tweet[1][:text], url: twitter_link )
  		end
  	end
  end
end
