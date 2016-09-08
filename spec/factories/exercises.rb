FactoryGirl.define do
  factory :exercise_benchpress, class: :exercise do
    name 'Benchpress'

    trait :with_categories do
      after(:create) do |instance|
        create_list :exercise_category, 3, exercises: [instance]
      end
    end
  end
end
