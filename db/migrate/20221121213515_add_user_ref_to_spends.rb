class AddUserRefToSpends < ActiveRecord::Migration[7.0]
  def change
    add_reference :spends, :user, null: false, foreign_key: true
  end
end
