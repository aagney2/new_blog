FactoryBot.define do
  factory :blog do
    author_name { Faker::Name.name }
    title  { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(sentence_count: 10) }
  end
end
