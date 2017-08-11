FactoryGirl.define do
  factory :comment do
    body { 1.upto(10).map { Faker::Lorem.word }.join(' ') }
  end
end
