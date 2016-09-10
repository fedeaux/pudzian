class AddUnitToExerciseStrenghtTests < ActiveRecord::Migration[5.0]
  def change
    add_column :exercise_strenght_tests, :unit, :string, default: 'kg'
  end
end
