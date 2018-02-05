FactoryBot.define do
  factory :client do
    name { FFaker::Lorem.word }
    phone { FFaker::PhoneNumber.cell_phone }
  end
end
