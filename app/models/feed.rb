class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
