class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.references :training, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
