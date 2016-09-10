class StrenghtBasedProgression < ApplicationRecord
  belongs_to :repetitions_signature
  belongs_to :exercise_strenght_test
  belongs_to :user
  has_one :exercise, through: :exercise_strenght_test

  def string_repetitions_signature=(string_repetitions_signature)
    if user
      self.repetitions_signature = RepetitionsSignature.where(
        signature: RepetitionsSignature.normalize(string_repetitions_signature),
        user: user
      ).first_or_create
    else
      @string_repetitions_signature = string_repetitions_signature
    end
  end

  def user=(user)
    super

    if @string_repetitions_signature
      self.string_repetitions_signature = @string_repetitions_signature
      @string_repetitions_signature = nil
    end
  end
end
