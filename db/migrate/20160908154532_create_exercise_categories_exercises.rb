class CreateExerciseCategoriesExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_categories_exercises do |t|
      t.integer :exercise_id
      t.integer :exercise_category_id
    end
  end
end
