class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status:{
    impossible:0,
    waiting:1,
    making:2,
    made_up:3
  }
end
