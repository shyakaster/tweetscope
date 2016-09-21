class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
    end
  end
end
