FactoryGirl.define do
  factory :exercise do
    name 'Exercise'

    factory :exercise_benchpress do
      name 'Benchpress'
    end

    factory :exercise_squat do
      name 'Squat'
    end

    trait :with_categories do
      after(:create) do |instance|
        create_list :exercise_category, 3, exercises: [instance]
      end
    end
  end
end
