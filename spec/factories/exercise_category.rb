FactoryGirl.define do
  sequence(:exercise_category_name) { |n| "Category #{n}" }

  factory :exercise_category do
    name { generate :exercise_category_name }
  end
end
