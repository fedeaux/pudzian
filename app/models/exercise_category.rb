class ExerciseCategory < ActiveRecord::Base
  validates :name, { presence: true }
  validates :slug, { presence: true }

  before_validation :ensure_slug
  has_and_belongs_to_many :exercises

  def ensure_slug
    if self.name.present? and self.slug.blank?
      self.slug = self.name.downcase.gsub(' ', '_')
    end
  end
end
