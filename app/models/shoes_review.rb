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

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @shoes_review = ShoesReview.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @shoes_review = ShoesReview.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @shoes_review = ShoesReview.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @shoes_review = ShoesReview.where("title LIKE?","%#{word}%")
    else
      @shoes_review = ShoesReview.all
    end
  end
