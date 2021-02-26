class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.decimal :percent
      t.integer :quantity

      t.timestamps
    end
  end
end
