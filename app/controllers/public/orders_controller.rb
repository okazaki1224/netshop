class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm#注文情報確認画面
    @order=Order.new(order_params)

    if params[:order][:address_number] == "0" #自身の住所、enum address:{main_address:0,sub_address:1,new_address:2}
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.first_name+current_customer.last_name
    elsif params[:order][:address_number] == "1"#登録済み住所
      @order.postal_code=Address.find(params[:order][:address_id]).postal_code
      @order.address=Address.find(params[:order][:address_id]).address
      @order.name=Address.find(params[:order][:address_id]).name
    else params[:order][:address_number] == "2"#新しい住所
      @address=Address.new
      @address.postal_code=params[:order][:postal_code]
      @address.address=params[:order][:address]
      @address.name=params[:order][:name]
      @address.customer_id=current_customer.id
      if @address.save
        @order.postal_code=@address.postal_code
        @order.address=@address.address
        @order.name=@address.name
      else
          render :new
      end
    end
  end

  def complete#サンクス画面
  end

  def index#注文履歴画面
  end

  def show#注文履歴詳細画面
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :select_address)
  end
end
