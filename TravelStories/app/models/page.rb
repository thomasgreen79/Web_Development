class Page < ActiveRecord::Base
  belongs_to :story
  has_many :text_elements, dependent: :destroy
  has_many :image_elements, dependent: :destroy
end
