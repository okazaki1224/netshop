class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :image
  belongs_to :genre

  #def get_image(width,height)
  #  image.variant(resize_to_limit:[width,height]).processed
  #end
  
  def add_tax_price
    (self.price*1.1).round
  end  
end
