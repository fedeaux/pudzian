FactoryGirl.define do
  factory :strenght_based_progression_step do
    strenght_based_progression { create :strenght_based_progression }
    done_at Date.new(2016, 7, 1)
    strenght_level 1
    done_set '8 x 30kg / 14 x 20kg / 5 x 30kg / 10 x 20kg'
    planned_set '6 x 30kg / 12 x 20kg / 6 x 30kg / 12 x 20kg'
  end
end
