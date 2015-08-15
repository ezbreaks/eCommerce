class AddIdToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :total_amount_cents, :integer
  	add_column :carts, :purchased_at, :date
  end

end
