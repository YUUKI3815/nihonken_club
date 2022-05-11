class Pet < ApplicationRecord
  has_one_attached :profile_image
  has_many :dog_images
  belongs_to :user
  belongs_to :dog_breed

  validates :name, presence: true
  validates :introduction, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
