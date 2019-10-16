class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :users, through: :favorites
  has_many :iine_users, through: :likes, source: :user

  def iine(user)
    favorites.create(user_id: user.id)
  end

  def uniine(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def iine?(user)
    iine_users.include?(user)
  end
end
