class AddExpressToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :express_token, :integer
  	add_column :orders, :express_payer_id, :integer
  end
end
