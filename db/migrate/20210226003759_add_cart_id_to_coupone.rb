class AddCartIdToCoupone < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :cart_id, :integer, default: nil
  end
end
