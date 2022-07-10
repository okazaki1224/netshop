class Admin::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page]).per(3)
    #ページャ導入により.allから書き換え
    #@genre=Genre.find(params[:id])
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @genres=Genre.all
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
  end
end
