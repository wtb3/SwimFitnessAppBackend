class Exercise < ApplicationRecord
  has_many :routines
  has_many :users, through: :routines

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :video_url, presence: true
end
