class Coupon < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :cart


end
