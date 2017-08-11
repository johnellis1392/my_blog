FactoryGirl.define do
  factory :user do
    # password { Faker::Lorem.word }
    # thumbnail { Faker::Avatar.image } # For generating images

    email { Faker::Internet.unique.email }
    password { Faker::RickAndMorty.quote }
  end
end
