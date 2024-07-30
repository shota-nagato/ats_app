class AddAccountIdNotNullToUser < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :account_id, false
  end
end
