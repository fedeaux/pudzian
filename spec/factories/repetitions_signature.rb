FactoryGirl.define do
  factory :repetitions_signature do
    user { create_or_find_user :user_ray }
    signature '6 15s/12 90s/6 15s/12 90s'
  end
end
