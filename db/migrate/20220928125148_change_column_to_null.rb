class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :total_payment, true
  end
end
