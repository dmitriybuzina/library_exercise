FactoryBot.define do
  factory :book do |f|
    f.name { Faker::Lorem.word }
    f.author { Faker::Lorem.name }
    f.description { Faker::Lorem.words }
    f.year { 2000 }
    f.publishing_house { Faker::Lorem.word }
  end
end
