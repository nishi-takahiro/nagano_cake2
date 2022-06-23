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
Customer.create!(first_name: '奈良', last_name: '太郎', first_name_kana: 'ナラ', last_name_kana: 'タロウ', email: '00@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000001', address: '奈良県', telephone_number: '000000000001', password: 'aaaaaa',)
Customer.create!(first_name: 'のび',last_name: 'のび太', first_name_kana: 'ノビ', last_name_kana: 'ノビタ', email: '01@gmail.com', encrypted_password: 'aaaaaa', postal_code: '0000002', address: '東京都', telephone_number: '000000000002', password: 'aaaaaa',)

#ジャンル
Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: '焼き菓子')
Genre.create!(name: 'キャンディ')