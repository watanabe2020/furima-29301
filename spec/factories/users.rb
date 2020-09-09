FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 4, max_length: 12) + 'a1' }
    first_name            { Gimei.kanji }
    last_name             { Gimei.hiragana }
    first_name_kana       { Gimei.first.katakana }
    last_name_kana        { Gimei.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
