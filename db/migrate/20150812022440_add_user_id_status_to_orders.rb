class AddUserIdStatusToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :user_id, :integer
  	add_column :orders, :status, :string
  end
end
