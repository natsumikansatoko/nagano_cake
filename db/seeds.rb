# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@admin",
  password: "000000"
)
  
20.times do |n|
  Customer.create!(
    last_name: Gimei.unique.last.kanji,
    first_name: Gimei.unique.first.kanji,
    last_name_kana: Gimei.unique.last.katakana,
    first_name_kana: Gimei.unique.first.katakana,
    email: Faker::Internet.unique.email,
    password: "123456",
    postal_code: "1234567",
    address: Gimei.unique.address.kanji,
    telephone_number: "09012345678",
    is_deleted: false
  )
end

Customer.create!(
  id: 21,
  last_name: "田中",
  first_name: "太郎",
  last_name_kana: "タナカ",
  first_name_kana: "タロウ",
  email: "test@test.com",
  password: "111111",
  postal_code: "1001000",
  address: "東京都千代田区二番町",
  telephone_number: "08011112222",
  is_deleted: false
  )
  
  Address.create!(
    customer_id: 21,
    postal_code: "2440812",
    address: "神奈川県横浜市戸塚区柏尾町3-9-10",
    name: "梅木匠"
  )
  
  Address.create!(
    customer_id: 21,
    postal_code: "4001114",
    address: "山梨県甲斐市打返4-15-19",
    name: "小沢時男"
  )
  
  Genre.create!(
    name: "ケーキ",
  )
  
  Genre.create!(
    name: "プリン",
  )
  
  Genre.create!(
    name: "焼き菓子",
  )
  
  Genre.create!(
    name: "キャンディ",
  )
  
  