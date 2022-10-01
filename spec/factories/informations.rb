FactoryBot.define do
  factory :information do
    title        {Faker::Name.name}
    category     {2}
    text         {Faker::Name.name}
    status       {1}

    association :user
  end
end
