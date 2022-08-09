class Admin::OrderDetailsController < ApplicationController
  def update
  #@order=Order.find(params[:id])
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    #@order=@order_detail.order
    if @order_detail.making_status=="making"
      @order_detail.order.update(order_status:2)
    end
    if @order_detail.order.order_details.count==@order_detail.order.order_details.made_up.count
      @order_detail.order.update(order_status:3)
    end

    redirect_to admin_order_path(@order_detail.order.id)
    #アソシエーション設定しているので@order_detailからorderをひっぱって来れる
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
