FactoryBot.define do
  factory :product do
    description { FFaker::Lorem.word }
    value { rand(1..9999) }
  end
end
