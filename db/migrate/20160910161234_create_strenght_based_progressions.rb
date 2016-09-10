class CreateStrenghtBasedProgressions < ActiveRecord::Migration[5.0]
  def change
    create_table :strenght_based_progressions do |t|
      t.belongs_to :repetitions_signature, foreign_key: true
      t.belongs_to :exercise_strenght_test, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.decimal :last_seen_strenght_level, default: 1.0, precision: 4, scale: 2

      t.timestamps
    end
  end
end
