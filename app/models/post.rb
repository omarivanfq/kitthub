class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :cat
end
