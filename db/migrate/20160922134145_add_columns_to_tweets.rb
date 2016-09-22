class AddColumnsToTweets < ActiveRecord::Migration
  def up
    add_column :tweets, :user_uid,:string
    add_column :tweets, :user_name,:string
    add_column :tweets, :user_screen_name, :string
    add_column :tweets, :user_image_url,:string
    add_column :tweets, :tweet_id,:string
    add_column :tweets, :tweet_created_at,:string
  end
  def down
    remove_column :tweets, :user_uid,:string
    remove_column :tweets, :user_name,:string
    remove_column :tweets, :user_screen_name, :string
    remove_column :tweets, :user_image_url,:string
    remove_column :tweets, :tweet_id,:string
    remove_column :tweets, :tweet_created_at,:string
  end
end
