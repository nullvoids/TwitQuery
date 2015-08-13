class Keyword < ActiveRecord::Base
	has_many :tweet_queries
	has_many :tweets, through: :tweet_queries
end
