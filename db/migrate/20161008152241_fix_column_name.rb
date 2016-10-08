class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :order, :details
  end
end
