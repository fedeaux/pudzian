class CreateRepetitionsSignatures < ActiveRecord::Migration[5.0]
  def change
    create_table :repetitions_signatures do |t|
      t.string :signature
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
