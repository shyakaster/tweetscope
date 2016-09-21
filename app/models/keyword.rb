class Keyword < ActiveRecord::Base
  has_many :tweets
  mount_uploader :image, ImageUploader
end
