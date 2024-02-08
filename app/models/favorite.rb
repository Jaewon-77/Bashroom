class Favorite < ApplicationRecord
  
  belongs_to :shoes_reviews 
  belongs_to :user
  
  validates :user_id, uniqueness: {scope: :shoes_review_id}
  
end
