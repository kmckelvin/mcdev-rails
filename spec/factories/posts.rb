FactoryGirl.define do
  factory :post do
    body "# Heading"

    trait :published do
      published true
      published_at Date.current
    end
  end
end
