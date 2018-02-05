FactoryBot.define do
  factory :client do
    name { FFaker::Lorem.word }
    phone { FFaker::PhoneNumberBR.international_mobile_phone_number }
  end
end
