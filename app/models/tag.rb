class Tag < ApplicationRecord
　#タグ機能
  has_many :post_tags, dependent: :destroy

end
