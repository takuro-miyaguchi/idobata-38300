FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    municipality          {Faker::Address.city}
    address               {Faker::Address.street_address}
  end
end
