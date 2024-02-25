FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + 'abc' }
    password_confirmation { password }
    first_name            { '試験' }
    last_name             { '試験' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birth_day             { '2000-10-10' }
  end
end
