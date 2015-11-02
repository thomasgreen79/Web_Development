class Story < ActiveRecord::Base
  belongs_to :user
  has_many :pages, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :travelStyle, presence: true
  validates :storyType, presence: true
  validates :status, presence: true
end
