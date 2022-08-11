class Public::ItemsController < ApplicationController
  def index

    @genres=Genre.all
    if params[:genre_id]
      @items=Item.where(genre_id: params[:genre_id])
    else
      @items=Item.all
    end
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
    #if @itemの数量が選択されていなかったら
      #render :show
    #end
    @genres=Genre.all

  end

  private
  def item_params
    params.require(:items).permit(:genre_id,:name,:introduction,:image,:price, :address_id)
  end
end
