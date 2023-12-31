class PanImage < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :pan_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    def get_image
      if image.attached?
        image
      else
        'no_image.jpg'
      end
    end
    
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
end