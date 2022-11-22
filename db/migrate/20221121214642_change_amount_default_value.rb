class ChangeAmountDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:spends, :amount, from: nil, to: 0)
  end
end
