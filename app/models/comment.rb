class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dog_images
  validates :comment, uniqueness: true
end
