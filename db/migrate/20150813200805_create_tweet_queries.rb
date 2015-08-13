class CreateTweetQueries < ActiveRecord::Migration
  def change
    create_table :tweet_queries do |t|
      t.belongs_to :keyword, index: true
      t.belongs_to :tweet, index: true
      t.timestamps null: false
    end
  end
end
