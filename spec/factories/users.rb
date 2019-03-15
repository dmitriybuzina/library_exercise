FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.username { Faker::Lorem.word }
    f.password { Faker::Internet.password }
  end
end
