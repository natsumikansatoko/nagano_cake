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

  Item.create!(
    genre_id: 1,
    name: "いちごのショートケーキ",
    introduction: "いちごをたっぷり使ったケーキです。",
    price: "2300",
    is_active: true,
    image: open("app/assets/images/ichigo.jpeg")
  )

  Item.create!(
    genre_id: 2,
    name: "プリン",
    introduction: "濃厚なたまごをたっぷり使用しました。",
    price: "450",
    is_active: true,
    image: open("app/assets/images/purine.jpeg")
  )

  Item.create!(
    genre_id: 3,
    name: "バームクーヘン",
    introduction: "しっとりバームクーヘンです。",
    price: "1200",
    is_active: true,
    image: open("app/assets/images/barm.jpeg")
  )

  Item.create!(
    genre_id: 4,
    name: "キャンディ詰め合わせ",
    introduction: "４種類の味(苺・メロン・レモン・オレンジ)が楽しめます。",
    price: "800",
    is_active: true,
    image: open("app/assets/images/candy.jpeg")
  )

  5.times do |n|
    Order.create!(
      customer_id: n + 1,
      postal_code: "123456#{ n + 1 }",
      address: "東京都千代田区二番町1-#{ n + 1 }",
      name: "test#{ n + 1 }",
      shipping_cost: "800",
      total_payment: "#{ 1000 + ( n * 1000 ) + 800 }",
      payment_method: "クレジットカード",
      status: "入金待ち"
    )
  end

  Order.create!(
    customer_id: 21,
    postal_code: "1234567",
    address: "東京都港区1-1-1",
    name: "test",
    shipping_cost: "800",
    total_payment: "1000 + 800",
    payment_method: "クレジットカード",
    status: "入金待ち"
  )

  5.times do |n|
    OrderDetail.create!(
      item_id: n + 1,
      order_id: n + 1,
      price: "#{ 1000 + ( n * 1000 )}",
      amount: "n + 2",
      making_status: "着手不可"
    )
  end