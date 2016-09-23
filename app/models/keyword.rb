class Keyword < ActiveRecord::Base
    has_many :tweets, dependent: :destroy
    mount_uploader :image, ImageUploader
    def grab_tweets
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = 'I03H6cLc0Rto6XeJg99QtniLg'
        config.consumer_secret     = 'oCbTWwpipf3nQHll3cnCdGKRhzUQ2p2xrctiCmz3JrJpA43kwv'
        config.access_token        = '18158734-IoUb64MxW1RlXMhQ5mZwiD9N1Mc3Negbz5z8K88Jh'
        config.access_token_secret = 'WD4zvUG0hRVO2wKdzqM7JUQWXpWSRqBkGOmUjdxQCweNt'
      end
      client.search(self.keyword, result_type: "recent").take(100).collect do |tweet|
        new_tweet = Tweet.new
        new_tweet.tweet_id= tweet.id.to_s
        new_tweet.tweet_created_at=tweet.created_at
        new_tweet.tweet = tweet.text
        new_tweet.user_uid = tweet.user.id
        new_tweet.user_name = tweet.user.name
        new_tweet.user_screen_name = tweet.user.screen_name
        new_tweet.user_image_url= tweet.user.profile_image_url.to_s
        new_tweet.keyword = self

        new_tweet.save
      end
    end
    def self.grab_all_tweets
      Keyword.all.each do |keyword|
        keyword.grab_tweets
      end
    end
end
