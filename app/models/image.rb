class Image < ApplicationRecord
  belongs_to :game, optional: true
  mount_uploader :url, ImageUploader
end
