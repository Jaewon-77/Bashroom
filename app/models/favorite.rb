class Favorite < ApplicationRecord
  
  belongs_to :shoes_reviews 
  belongs_to :user
end
