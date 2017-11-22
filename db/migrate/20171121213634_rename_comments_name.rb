class RenameCommentsName < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :name, :text
  end
end
