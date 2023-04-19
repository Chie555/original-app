FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation { password }
    sex_id                { Faker::Number.between(from: 1, to: 2) }
    birthday              { Faker::Date.birthday }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    weight                { Faker::randomFloat(1, 30, 200) }
    height                { Faker::randomFloat(1, 100, 200) }
    fat_percentage        { Faker::randomFloat(1, 3, 70) }
    taeget_bmi            { Faker::randomFloat(1, 10, 50) }
    taeget_weight         { Faker::randomFloat(1, 30, 200) }
  end
end
