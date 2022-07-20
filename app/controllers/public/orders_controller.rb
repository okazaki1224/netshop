class Public::OrdersController < ApplicationController
  def new
    #@customer=Customer.find(params[:id])
    @order=Order.new
  end

  def confirm#注文情報確認画面
    @cart_item=CartItem.all
    @cart_items=CartItem.all
  end

  def complete#サンクス画面
  end

  def index#注文履歴画面
  end

  def show#注文履歴詳細画面
  end
end
