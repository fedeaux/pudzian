class Exercise < ApplicationRecord
  validates :name, { presence: true }
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories, join_table: :exercise_categories_exercises, class_name: 'ExerciseCategory'
end
