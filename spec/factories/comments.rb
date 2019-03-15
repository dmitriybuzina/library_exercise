FactoryBot.define do
  factory :comment do |f|
    f.body { Faker::Lorem.sentence }
    f.book_id { FactoryBot.create(:book).id }
    f.user_id { FactoryBot.create(:user).id }
  end
end