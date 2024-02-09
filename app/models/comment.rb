class Comment < ApplicationRecord

  belongs_to :shoes_review
  belongs_to :user
end
