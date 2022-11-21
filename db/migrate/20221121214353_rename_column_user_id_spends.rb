class RenameColumnUserIdSpends < ActiveRecord::Migration[7.0]
  def change
    rename_column :spends, :user_id, :author_id
  end
end
