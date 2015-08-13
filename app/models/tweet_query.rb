class TweetQuery < ActiveRecord::Base
	belongs_to :tweet
	belongs_to :keyword
end
