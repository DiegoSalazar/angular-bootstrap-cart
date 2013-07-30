class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :variant_id
      t.integer :quantity
      t.string :status
      t.string :name
      t.decimal :price
      t.integer :savings_percentage
      t.decimal :savings_amount
      t.string :thumb_url
      t.string :image_url
      t.string :sale_type

      t.timestamps
    end
  end
end
