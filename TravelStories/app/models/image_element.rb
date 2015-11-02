class ImageElement < ActiveRecord::Base
  belongs_to :page
  mount_uploader :path, PictureUploader
end
