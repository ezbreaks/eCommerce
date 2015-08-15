class AddCardInfoToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :cart_id, :integer
  	add_column :orders, :card_type, :string 
  	add_column :orders, :card_expires_on, :date
  end
end
