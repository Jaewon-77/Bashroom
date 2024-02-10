class ShoesReview < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #タグ機能
  has_many :tags, through: :post_tags

#靴機能点数合計
  def sum_total
    total = self.traction + self.cushion + self.fit + self.support + self.weight
    return total
  end

#いいね機能
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
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

  # タグ付けの新規投稿用メソッド
  def save_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end






end