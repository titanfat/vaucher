class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  # has_many :coupon , through: :user, dependent: :destroy
  has_one :coupon, through: :user, dependent: :destroy
  accepts_nested_attributes_for :coupon, :reject_if lambda { |carts| carts.cart_id.blank? }
  validates_associated :coupon

  def total_price
    apply_discount(price_before_percent)
  end

  def apply_discount(price, coupon = nil)
    return price if coupon.nil?
    if coupon.percent.present?
      price = price - ((price / 10) * coupon.percent)
    end
    price < 0 ? 0 : price
  end

  def discount_amount
    price_before_percent - total_price
  end

  private

  def price_before_percent
    @_price_before_percent ||=self.inject(0) { |sum, product | sum += (product.price * product.quantity) }
  end

  # total_price.format


end
