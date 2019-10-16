class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :feed
    counter_culture :feed
    validates :user_id, presence: true
    validates :feed_id, presence: true
end
