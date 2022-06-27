# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#管理者
Admin.create!(
   email: 'admin@admin',
   password: '7777777',
   password_confirmation: '7777777',
)

#ユーザー
Customer.create!(first_name: '奈良', last_name: '太郎', first_name_kana: 'ナラ', last_name_kana: 'タロウ', email: '00@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000001', address: '奈良県奈良市', telephone_number: '000000000001', password: 'aaaaaa',)
Customer.create!(first_name: 'のび',last_name: 'のび太', first_name_kana: 'ノビ', last_name_kana: 'ノビタ', email: '01@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000002', address: '東京都渋谷区', telephone_number: '000000000002', password: 'aaaaaa',)
Customer.create!(first_name: '東京', last_name: '太郎', first_name_kana: 'トウキョウ', last_name_kana: 'タロウ', email: '02@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000003', address: '東京都目黒区', telephone_number: '000000000003', password: 'aaaaaa',)
Customer.create!(first_name: '大阪', last_name: '太郎', first_name_kana: 'オオサカ', last_name_kana: 'タロウ', email: '03@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000004', address: '大阪大阪市', telephone_number: '000000000004', password: 'aaaaaa',)
Customer.create!(first_name: '福岡', last_name: '太郎', first_name_kana: 'フクオカ', last_name_kana: 'タロウ', email: '04@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000005', address: '福岡', telephone_number: '000000000005', password: 'aaaaaa',)
Customer.create!(first_name: '富山', last_name: '太郎', first_name_kana: 'トヤマ', last_name_kana: 'タロウ', email: '05@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000006', address: '富山県氷見市', telephone_number: '000000000006', password: 'aaaaaa',)
Customer.create!(first_name: '愛知', last_name: '太郎', first_name_kana: 'アイチ', last_name_kana: 'タロウ', email: '06@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000007', address: '愛知名県古屋市', telephone_number: '000000000007', password: 'aaaaaa',)
Customer.create!(first_name: '沖縄', last_name: '太郎', first_name_kana: 'オキナワ', last_name_kana: 'タロウ', email: '07@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000008', address: '沖縄県名護市', telephone_number: '000000000008', password: 'aaaaaa',)
Customer.create!(first_name: '北海道', last_name: '太郎', first_name_kana: 'ホッカイドウ', last_name_kana: 'タロウ', email: '08@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000009', address: '北海道札幌市', telephone_number: '000000000009', password: 'aaaaaa',)
Customer.create!(first_name: '京都', last_name: '太郎', first_name_kana: 'キョウト', last_name_kana: 'タロウ', email: '09@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000010', address: '京都府京都市', telephone_number: '000000000010', password: 'aaaaaa',)
Customer.create!(first_name: 'アメリカ', last_name: '太郎', first_name_kana: 'アメリカ', last_name_kana: 'タロウ', email: '10@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000011', address: 'アメリカ', telephone_number: '000000000011', password: 'aaaaaa',)

#ジャンル
Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: '焼き菓子')
Genre.create!(name: 'キャンディ')

#アイテム
item = Item.create!( genre_id: 1, name: 'ウェディングケーキ', introduction: 'グループでのパーティーなどにおすすめです', price: '10000',)
item.image.attach(io: open("app/assets/images/cake.jpg"),filename: 'cake.jpg')

item = Item.create!( genre_id: 1, name: 'イチゴのショートケーキ', introduction: 'イチゴのショートケーキ、イチゴのショートケーキ、イチゴのショートケーキ、イチゴのショートケーキ、イチゴのショートケーキ', price: '560',)
item.image.attach(io: open("app/assets/images/test.jpg"),filename: 'test.jpg')

item = Item.create!( genre_id: 2, name: 'プリン', introduction: 'プリンプリンプリンプリンプリンプリンプリンプリン', price: '780',)
item.image.attach(io: open("app/assets/images/test1.jpg"),filename: 'test1.jpg')

item = Item.create!( genre_id: 3, name: 'イチゴのマカロン', introduction: 'イチゴのマカロン、イチゴのマカロン、イチゴのマカロン、イチゴのマカロン、イチゴのマカロン、', price: '980',)
item.image.attach(io: open("app/assets/images/test_1.jpg"),filename: 'test_1.jpg')

item = Item.create!( genre_id: 3, name: '抹茶のマカロン', introduction: '抹茶のマカロン、抹茶のマカロン、抹茶のマカロン、抹茶のマカロン、抹茶のマカロン、', price: '1200',)
item.image.attach(io: open("app/assets/images/test_1.jpg"),filename: 'test_1.jpg')

item = Item.create!( genre_id: 4, name: 'コーラのキャンディ', introduction: 'コーラのキャンディ、コーラのキャンディ、コーラのキャンディ、コーラのキャンディ、コーラのキャンディ、', price: '1500',)
item.image.attach(io: open("app/assets/images/test3.jpg"),filename: 'test3.jpg')

item = Item.create!( genre_id: 4, name: 'イチゴのキャンディ', introduction: 'イチゴのキャンディ、イチゴのキャンディ、イチゴのキャンディ、イチゴのキャンディ、イチゴのキャンディ、', price: '570',)
item.image.attach(io: open("app/assets/images/test3.jpg"),filename: 'test3.jpg')

item = Item.create!( genre_id: 3, name: 'ランダムマカロン', introduction: 'ランダムマカロン、ランダムマカロン、ランダムマカロン、ランダムマカロン、ランダムマカロン、', price: '5600',)
item.image.attach(io: open("app/assets/images/test_1.jpg"),filename: 'test_1.jpg')

item = Item.create!( genre_id: 4, name: 'キャンディの詰め合わせ', introduction: 'キャンディの詰め合わせ、キャンディの詰め合わせ、キャンディの詰め合わせ、キャンディの詰め合わせ、キャンディの詰め合わせ、', price: '6000',)
item.image.attach(io: open("app/assets/images/test3.jpg"),filename: 'test3.jpg')