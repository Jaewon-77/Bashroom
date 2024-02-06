class ShoesReview < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tag, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  def sum_total
    total = self.traction + self.cushion + self.fit + self.support + self.weight
    return total
  end
end
