class AddIsCompletedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_completed, :boolean, :default => false  
  end
end
