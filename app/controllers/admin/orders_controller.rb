class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @customer=Customer.find(params[:id])
    @order_details=OrderDetail.all
    @order_detail=OrderDetail.find(params[:id])
  end
end
