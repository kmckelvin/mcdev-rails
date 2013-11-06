FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "The post #{n}" }
    body "# Heading"

    trait :published do
      published true
      published_at "2013-08-10"
    end
  end
end
