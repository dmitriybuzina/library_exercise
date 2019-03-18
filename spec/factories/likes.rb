FactoryBot.define do
  factory :like do |f|
    f.count_of_stars { Faker::Number.between(1, 5) }
    association :user, factory: :user
    association :book, factory: :book
  end
end