FactoryGirl.define do
  factory :exercise_strenght_test do
    user { create_or_find_user :user_ray }
    exercise { create :exercise_benchpress }
    mr_weights {{ 1 => 50, 2 => 45, 4 => 40, 6 => 35, 9 => 30, 12 => 25, 15 => 20, 18 => 17, 21 => 14, 25 => 12, 30 => 10, 40 => 5 }}
  end
end
