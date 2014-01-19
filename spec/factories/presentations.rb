# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presentation do
    title "RSpec Best Practices"
    presented_on "2014-01-10"
    event "Rubyfuza 2013"
    video_url "http://videourl.com/"
    slides_url "http://slidesurl.com/"

    trait :future do
      presented_on 1.day.from_now
    end

    trait :past do
      presented_on 1.day.ago
    end
  end
end
