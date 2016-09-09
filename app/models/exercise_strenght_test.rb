class ExerciseStrenghtTest < ActiveRecord::Base
  validates :user, { presence: true }
  validates :exercise, { presence: true }
  validates :mr_weights, { presence: true }

  belongs_to :user
  belongs_to :exercise

  serialize :mr_weights
  after_initialize :ensure_mr_weights

  REPETITION_REGIONS = [1, 2, 4, 6, 9, 12, 15, 18, 21, 25, 30, 40]

  def ensure_mr_weights
    unless self.mr_weights.is_a? Hash
      self.mr_weights= {}
    end
  end

  def mr_weights=(hash)
    super ExerciseStrenghtTest.default_mr_weights.merge hash
  end

  def self.default_mr_weights
    REPETITION_REGIONS.map { |repetitions|
      [repetitions, nil]
    }.to_h
  end
end
