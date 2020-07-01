class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :text, null: false
      t.boolean :is_completed

      t.integer :project_id

      t.timestamps
    end
  end
end

