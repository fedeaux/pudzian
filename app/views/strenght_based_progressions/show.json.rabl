object :@strenght_based_progression
extends 'strenght_based_progressions/base'
attributes :repetitions_with_weights

child :exercise do
  attributes :id, :name
end
