module TwitterRequestHandler
	require 'base64'
	require 'cgi'
	extend ActiveSupport::Concern

	def obtain_bearer_token
		response = HTTParty.post(
			"https://api.twitter.com/oauth2/token",
			body:'grant_type=client_credentials',
			headers: { 'Authorization' => "Basic #{generate_encoded_credentials}", 'Content-Type' => 'application/x-www-form-urlencoded;charset=UTF-8'}
		)
		if response["token_type"] == "bearer"
			session[:twitter_bearer_token] = response["access_token"] 
			return session[:twitter_bearer_token] 
		else
			raise Exception.new("Error: Response token type was not bearer")
		end
	end

	def search_tweets( query, bearer_token )
		encoded_query = CGI.escape(query)
	 	return HTTParty.get(		
			"https://api.twitter.com/1.1/search/tweets.json?q=#{encoded_query}&result_type=recent&count=11",
			headers: { 'Authorization' => "Bearer #{bearer_token}" }
			)
	end

private
	def generate_encoded_credentials
		Base64.encode64( ENV['CONSUMER_KEY'] + ':' + ENV['CONSUMER_SECRET']).gsub(/\n/,"")
	end
end