class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    #@customer=Customer.find(params[:id])
    #@order_details=@order.order_details.all
    @order_detail=OrderDetail.find(params[:id])
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status=="paid_up"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status:1)
      endw
    end
    redirect_to admin_order_path(@order.id)

  end

  private
  def order_params
    params.require(:order).permit(:order_status, :making_status)
  end
end
