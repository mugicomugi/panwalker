class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :pan_image
end
