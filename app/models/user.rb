class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one_attached :image
 has_many :shoes_reviews, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :favorite_shoes_reviews, through: :favorites, source: :shoes_review
 # フォローをした、されたの関係
 has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

# 一覧画面で使う
has_many :followings, through: :relationships, source: :followed
has_many :followers, through: :reverse_of_relationships, source: :follower

# フォローしたときの処理
def follow(user_id)
  relationships.create(followed_id: user_id)
end
# フォローを外すときの処理
def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
end
# フォローしているか判定
def following?(user)
  followings.include?(user)
end

def is_profile_set?
  first_name? && last_name? && first_name_kana? && last_name_kana? && address? && size? && age? && favorite_brand? && favorite_shoes_name
end



GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guestuser"
    end
  end




# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("nickname LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("nickname LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("nickname LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("nickname LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
  #会員ステータス
  def user_status
    if is_active?
      "有効"
    else
      "退会"
    end
  end
  
  





end