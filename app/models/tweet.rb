class Tweet < ActiveRecord::Base
	has_many :tweet_queries
	has_many :keywords, through: :tweet_queries
end
