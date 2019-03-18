FactoryBot.define do
  factory :history do |f|
    f.take { Faker::Time.backward }
    f.return { Faker::Time.forward }
    association :book, factory: :book
    association :user, factory: :user
  end
end
