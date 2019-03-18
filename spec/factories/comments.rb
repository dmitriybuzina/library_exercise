FactoryBot.define do
  factory :comment do |f|
    f.body { Faker::Lorem.sentence }
    association :user, factory: :user
    association :book, factory: :book
  end
end
