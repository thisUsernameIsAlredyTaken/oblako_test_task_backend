class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :title, :text
  end
end
