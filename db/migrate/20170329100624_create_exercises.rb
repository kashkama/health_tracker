class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.column :exercise, :string
      t.column :calories, :integer
      t.column :user_id, :integer
      
      t.timestamps
    end
  end
end
