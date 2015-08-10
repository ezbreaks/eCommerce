class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :link 
      t.text :description

      t.timestamps null: false
    end
  end
end
