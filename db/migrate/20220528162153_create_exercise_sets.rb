class CreateExerciseSets < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_sets do |t|
      t.references :exercise, null: false
      t.integer :value, limit: 2, null: false, default: 0
      t.integer :repetitions, limit: 2, null: false
      t.timestamps
    end
  end
end
