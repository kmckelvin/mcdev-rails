# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "EFHooks"
    language "C#"
    description "The EFHooks project"
    github_url "https://github.com/"
  end
end
