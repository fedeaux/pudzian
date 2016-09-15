class CreateStrenghtBasedProgressionSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :strenght_based_progression_steps do |t|
      t.date :done_at
      t.belongs_to :strenght_based_progression, foreign_key: true, index: { name: :strenght_based_progression_to_steps_index }
      t.decimal :strenght_level, default: 1.0, precision: 4, scale: 2
      t.string :planned_set
      t.string :done_set

      t.timestamps
    end
  end
end
