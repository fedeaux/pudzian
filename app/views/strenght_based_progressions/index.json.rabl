object false

child :@strenght_based_progressions do
  attributes :id
  child(:repetitions_signature) { attributes :id, :signature }
end

node(:exercise_has_strenght_test) { @exercise_has_strenght_test }
