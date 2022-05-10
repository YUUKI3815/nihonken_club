class DogBreed < ApplicationRecord
  has_many :pets
  validates :name, presence: true
end
