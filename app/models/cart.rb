class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  # has_many :coupon , through: :user, dependent: :destroy
  has_one :coupon, through: :user, dependent: :destroy
  accepts_nested_attributes_for :coupon, if: lambda { |carts| carts.cart_id.blank? }
  validates_associated :coupon

  def total_price(coupon = nil)
    if coupon.present?
      (product.price * quantity) / coupon
    else
      product.price * quantity
    end
  end

  # total_price.format


end
