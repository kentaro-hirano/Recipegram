class Recipe < ApplicationRecord
    attachment :image
    
    belongs_to :user
    has_many :recipe_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    
    with_options presence: true do
        validates :title
        validates :body
        validates :image
    end
    
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
