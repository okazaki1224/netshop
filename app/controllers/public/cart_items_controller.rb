class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
    #@cart_item=CartItem.find(params[:id])
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to '/cart_items'
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to '/cart_items'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to '/cart_items'
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

   #
    if CartItem.exists?(item_id: @cart_item.item_id)
      exist_cart_item=CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
      exist_cart_item.update(amount: exist_cart_item.amount+@cart_item.amount)
      redirect_to "/cart_items"
    else
      @cart_item.save
      @cart_items =current_customer.cart_items.all
      redirect_to "/cart_items"
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
