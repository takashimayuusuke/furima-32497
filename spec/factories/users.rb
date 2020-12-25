FactoryBot.define do
  factory :user do
    name { 'たかしま' }
    email { Faker::Internet.free_email }
    password = 'yt252525'
    password { password }
    password_confirmation { password }
    last_name_chinese_character { '佑介' }
    first_name_chinese_character { '高嶋' }
    last_name_kana { 'ユウスケ' }
    first_name_kana { 'タカシマ' }
    birth { '1988-12-07' }
  end
end
