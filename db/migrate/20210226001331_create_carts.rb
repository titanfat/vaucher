class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :name
      t.text :adress
      t.integer :pay_type
      t.string :email

      t.timestamps
    end
  end
end
