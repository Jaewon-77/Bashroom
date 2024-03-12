# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# rails db:seedを忘れずに
Admin.create!(
  email: 'admin@admin.com',
  password: '000000'
)
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mashroom = User.find_or_create_by!(email: "mashroom@bashroom.com") do |user|
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mashroomchan.jpg"), filename:"mashroomchan.jpg")
  user.last_name = "Mash"
  user.first_name = "Room"
  user.last_name_kana = "マッシュ"
  user.first_name_kana = "ルーム"
  user.password = "000000"
  user.nickname = "マッシュルームちゃん"
  user.address = "愛知県"
  user.favorite_brand = "Dynamic Speed"
  user.favorite_shoes_name = "Dynamic7"
  user.size = "26.5"
  user.age = "21"
end

kinoko = User.find_or_create_by!(email: "kinoko@bashroom.com") do |user|
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kinokokun.jpg"), filename:"kinokokun.jpg")
  user.last_name = "Kino"
  user.first_name = "Ko"
  user.last_name_kana = "キノ"
  user.first_name_kana = "コ"
  user.password = "000000"
  user.nickname = "キノくん"
  user.address = "大阪"
  user.favorite_brand = "Extreme Power"
  user.favorite_shoes_name = "Extreme3"
  user.size = "25.5"
  user.age = "23"
end

eringi = User.find_or_create_by!(email: "eringi@bashroom.com") do |user|
  user.last_name = "Erin"
  user.first_name = "Gi"
  user.last_name_kana = "エリン"
  user.first_name_kana = "ギ"
  user.password = "000000"
  user.nickname = "リンギくん"
  user.address = "東京"
  user.favorite_brand = "Dynamic Speed"
  user.favorite_shoes_name = "Speed3"
  user.size = "28.5"
  user.age = "24"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/eringikun.jpg"), filename:"eringikun.jpg")
end

maitake = User.find_or_create_by!(email: "maitake@bashroom.com") do |user|
  user.last_name = "Mai"
  user.first_name = "Take"
  user.last_name_kana = "マイ"
  user.first_name_kana = "タケ"
  user.password = "000000"
  user.nickname = "タッケ"
  user.address = "北海道"
  user.favorite_brand = "Legend Pro"
  user.favorite_shoes_name = "Legend13"
  user.size = "27.5"
  user.age = "25"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/maitakekun.jpg"), filename:"maitakekun.jpg")
end

paul = User.find_or_create_by!(email: "paul@bashroom.com") do |user|
  user.last_name = "Pop"
  user.first_name = "Paul"
  user.last_name_kana = "ポップ"
  user.first_name_kana = "ポール"
  user.password = "000000"
  user.nickname = "ポール"
  user.address = "秋田県"
  user.favorite_brand = "Legend Pro"
  user.favorite_shoes_name = "Pro8"
  user.size = "26.5"
  user.age = "27"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/paul.jpg"), filename:"paul.jpg")
end

genboku = User.find_or_create_by!(email: "genboku@bashroom.com") do |user|
  user.last_name = "Gen"
  user.first_name = "Boku"
  user.last_name_kana = "ゲン"
  user.first_name_kana = "ボク"
  user.password = "000000"
  user.nickname = "ゲンボくん"
  user.address = "長野県"
  user.favorite_brand = "Extreme Power"
  user.favorite_shoes_name = "Power5"
  user.size = "27"
  user.age = "26"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/genbokun.jpg"), filename:"genbokun.jpg")
end

enoki = User.find_or_create_by!(email: "enoki@bashroom.com") do |user|
  user.last_name = "Eno"
  user.first_name = "Ki"
  user.last_name_kana = "エノ"
  user.first_name_kana = "キ"
  user.password = "000000"
  user.nickname = "エノくん"
  user.address = "福岡県"
  user.favorite_brand = "Dynamic Speed"
  user.favorite_shoes_name = "Dynamic5"
  user.size = "28"
  user.age = "25"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/enokikun.jpg"), filename:"enokikun.jpg")
end


ShoesReview.find_or_create_by!(title: "Dynamic7 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dynamic7.jpg"), filename:"dynamic7.jpg")
  shoes_review.review = "すごい履きやすい靴です。クッションがすごくいいです。おすすめします。"
  shoes_review.user = mashroom
  shoes_review.traction = "9"
  shoes_review.cushion = "10"
  shoes_review.fit = "8"
  shoes_review.support = "8"
  shoes_review.weight = "7"
end

ShoesReview.find_or_create_by!(title: "Speed3 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/speed3.jpg"), filename:"speed3.jpg")
  shoes_review.review = "軽くて動きやすい靴です。"
  shoes_review.user = eringi
  shoes_review.traction = "8"
  shoes_review.cushion = "8"
  shoes_review.fit = "9"
  shoes_review.support = "8"
  shoes_review.weight = "10"
end

ShoesReview.find_or_create_by!(title: "Legend13 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/legend13.jpg"), filename:"legen13.jpg")
  shoes_review.review = "滑りにくい靴です。左右と前後両方思う通り止まります。"
  shoes_review.user = maitake
  shoes_review.traction = "10"
  shoes_review.cushion = "7"
  shoes_review.fit = "8"
  shoes_review.support = "7"
  shoes_review.weight = "9"
end

ShoesReview.find_or_create_by!(title: "Pro8 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pro8.jpg"), filename:"pro8.jpg")
  shoes_review.review = "足首をちゃんと保護できます。"
  shoes_review.user = paul
  shoes_review.traction = "8"
  shoes_review.cushion = "9"
  shoes_review.fit = "8"
  shoes_review.support = "10"
  shoes_review.weight = "7"
end

ShoesReview.find_or_create_by!(title: "Power5 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/power5.jpg"), filename:"power5.jpg")
  shoes_review.review = "足にフィットします。"
  shoes_review.user = genboku
  shoes_review.traction = "8"
  shoes_review.cushion = "8"
  shoes_review.fit = "10"
  shoes_review.support = "8"
  shoes_review.weight = "8"
end

ShoesReview.find_or_create_by!(title: "Dynamic5 レビュー") do |shoes_review|
  shoes_review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dynamic5.jpg"), filename:"dynamic5.jpg")
  shoes_review.review = "クッションの反発力がとてもいいです"
  shoes_review.user = enoki
  shoes_review.traction = "8"
  shoes_review.cushion = "9"
  shoes_review.fit = "7"
  shoes_review.support = "8"
  shoes_review.weight = "8"
end
