class AddPrecisionToExerciseStrenghtTest < ActiveRecord::Migration[5.0]
  def change
    add_column :exercise_strenght_tests, :precision, :decimal, default: 1.0, precision: 4, scale: 2
  end
end
