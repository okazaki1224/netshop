class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status:{
    waiting:0,
    paid_up:1,
    making:2,
    preparing:3,
    shipped:4
  }

  enum address_number:{
    main_address:0,
    sub_address:1,
    new_address:2
  }

  def subtotal
    item.add_tax_price*amount
  end

end
