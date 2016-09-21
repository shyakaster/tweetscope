class AddKeywordToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :keyword, index: true, foreign_key: true
  end
end
