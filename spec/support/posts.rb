FactoryGirl.define do
  factory :post do
    title { Faker::RickAndMorty.character }
    body { Faker::RickAndMorty.quote }
  end
end
