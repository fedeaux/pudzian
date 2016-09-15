class StrenghtBasedProgressionStep < ApplicationRecord
  belongs_to :strenght_based_progression
  validates :strenght_level, presence: true
  validates :planned_set, presence: true
  validates :done_set, presence: true
  validates :strenght_based_progression, presence: true

  before_save :ensure_done_at

  def ensure_done_at
    unless self.done_at
      self.done_at = Date.today
    end
  end
end
