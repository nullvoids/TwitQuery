class CreateTweetQueries < ActiveRecord::Migration
  def change
    create_table :tweet_queries do |t|

      t.timestamps null: false
    end
  end
end
