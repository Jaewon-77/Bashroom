class PostTag < ApplicationRecord
  #タグ機能
  belongs_to :shoes_review
  belongs_to :tag

  validates :shoes_review_id, presence: true
  validates :tag_id, presence: true

end
