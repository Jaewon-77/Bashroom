class ShoesReview < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tag, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
