FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation { password }
    sex_id                { Faker::Number.between(from: 1, to: 2) }
    birthday              { Faker::Date.birthday }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    weight                { 45.3 }
    height                { 150.3 }
    fat_percentage        { 20.5 }
    target_weight         { 40.2 }
  end
end
