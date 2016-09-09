class CreateExerciseStrenghtTest < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_strenght_tests do |t|
      t.text :mr_weights
      t.belongs_to :user, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.date :took_on
    end
  end
end
