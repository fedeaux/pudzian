class ExerciseStrenghtTest < ActiveRecord::Base
  validates :user, { presence: true }
  validates :exercise, { presence: true }
  validates :mr_weights, { presence: true }

  belongs_to :user
  belongs_to :exercise

  serialize :mr_weights

  REPETITION_REGIONS = [2, 4, 6, 9, 12, 15, 18, 21, 25, 30, 40]

  def self.default_mr_weights
    REPETITION_REGIONS.map { |repetitions|
      [repetitions, -1]
    }.to_h
  end
end
