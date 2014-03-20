FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@user.com"}
    password "foobar"
    password_confirmation "foobar"

    trait :student do
      role_id 1
    end

    trait :instructor do
      role_id 2
    end

    trait :admin do
      role_id 4
    end

    trait :ta do
      role_id 5
    end
  end

  factory :course do
    name "class"
    association :instructor, factory: [:user, :instructor]
    directory_path "class"
  end

  factory :assignment do
    name "ass"
    directory_path "ass"
    association :course, factory: [:course]
    association :instructor, factory: [:user, :instructor]
    require_signup true
    max_team_size 3
  end

  factory :topic do
    association :assignment, factory: :assignment
    sequence(:topic_name)  { |n| "topic#{n}" }
    sequence(:topic_identifier) { |n| "topic#{n}"}
  end

  factory :participants do
    association :user, factory: [:user, :student]
    association :assignment, factory: :assignment
    type "AssignmentParticipant"
  end

end