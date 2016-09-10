FactoryGirl.define do
  factory :strenght_based_progression do
    user { create_or_find_user :user_ray }
    string_repetitions_signature '6 15s/12 90s/6 15s/12 90s'
    exercise_strenght_test { create :exercise_strenght_test }
  end
end
