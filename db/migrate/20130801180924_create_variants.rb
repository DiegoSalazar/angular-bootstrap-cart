class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
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
