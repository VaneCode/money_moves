class CreateJoinTableGroupSpend < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :spends do |t|
      # t.index [:group_id, :spend_id]
      # t.index [:spend_id, :group_id]
    end
  end
end
