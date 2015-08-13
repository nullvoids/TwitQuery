class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
		  t.string :content
		  t.string :url
      t.timestamps null: false
    end
  end
end
