class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog_image
end
