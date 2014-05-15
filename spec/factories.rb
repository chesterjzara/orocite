FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :idea do
    content "Lorem ipsum"
    proof "example.com"
    user
    argument
  end

  factory :argument do
    topic "computer science"
    locked false
    user
  end 


end